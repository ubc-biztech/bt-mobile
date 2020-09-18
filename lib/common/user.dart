import 'dart:convert';

import 'package:flutter/material.dart';

class User {
  User({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.isAdmin,
    @required this.studentId,
  });

  /// Create a User object from information from [Cognito].
  ///
  /// We create our User object from the [idToken], which holds the user
  /// attributes. Unfortunately, the [Cognito.getUserAttributes] function does
  /// not include everything, so we will primarily get the information from the
  /// parsed [idToken]. HOWEVER, the [idToken] does not contain custom fields
  /// (like student_id), so we must get that from [userAttributes].
  ///
  /// ^ This changes from time to time as the [Cognito] library changes.
  ///   BE PREPARED for things to change.
  factory User.fromIdTokenAndUserAttributes(
      String idToken, Map<String, dynamic> userAttributes) {
    Map<String, dynamic> tokenMap = _parseJwt(idToken);
    if (tokenMap == null) {
      throw Error();
    }
    String email = tokenMap['email'].toString();
    List<String> name = tokenMap['name'].toString().split(' ').toList();
    List<dynamic> groups = tokenMap['cognito:groups'].toList();
    bool isAdmin =
        groups.contains('admin') || email.endsWith('@ubcbiztech.com');

    // If custom:student_id doesn't exist in tokenMap, check userAttributes.
    int studentId = tokenMap.containsKey('custom:student_id')
        ? int.tryParse(tokenMap['custom:student_id']) ?? -1
        : userAttributes.containsKey('custom:student_id')
            ? userAttributes['custom:student_id']
            : -1;
    return User(
        firstName: name.first,
        lastName: name.last,
        email: email,
        isAdmin: isAdmin,
        studentId: studentId);
  }

  /// Alright, even I barely know what's going on here. Basically, we aren't
  /// blessed with a wonderful Amplify SDK for Flutter, which means we need to
  /// do more manual labor in comparison to the web app. The [idToken] we get
  /// from an authenticated user is actually a JWT token (JSON Web Token) that
  /// can be parsed into a JSON structure.
  static Map<String, dynamic> _parseJwt(String idToken) {
    final parts = idToken.split('.');
    if (parts.length != 3) {
      return null;
    }
    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      return null;
    }
    return payloadMap;
  }

  static String _decodeBase64(String splitToken) {
    String normalizedSource = base64Url.normalize(splitToken);
    return utf8.decode(base64Url.decode(normalizedSource));
  }

  String firstName;
  String lastName;
  String email;
  bool isAdmin;
  String inviteCode;
  int studentId;
  String faculty;
  String year;
  String diet;
  String heardFrom;
  String pronouns;

  void updateUserDetailsFromMap(Map<String, dynamic> details) {
    if (details.containsKey('fname')) {
      firstName = details['fname'];
    }
    if (details.containsKey('lname')) {
      lastName = details['lname'];
    }
    if (details.containsKey('inviteCode')) {
      inviteCode = details['inviteCode'];
    }
    if (details.containsKey('id')) {
      studentId = details['id'];
    }
    if (details.containsKey('faculty')) {
      faculty = details['faculty'];
    }
    if (details.containsKey('year')) {
      year = details['year'];
    }
    if (details.containsKey('diet')) {
      diet = details['diet'];
    }
    if (details.containsKey('heardFrom')) {
      heardFrom = details['heardFrom'];
    }
    if (details.containsKey('gender')) {
      pronouns = details['gender'];
    }
  }

  Map<String, dynamic> get userDetails {
    Map<String, dynamic> details = {
      'email': email,
      'fname': firstName,
      'lname': lastName,
      'id': studentId,
      'faculty': faculty,
      'year': year,
      'diet': diet,
      'heardFrom': heardFrom,
      'gender': pronouns,
    };
    if (inviteCode != null && inviteCode.isNotEmpty) {
      details['inviteCode'] = inviteCode;
    }
    return details;
  }

  bool get isStudentIdValid =>
      studentId != null && studentId > 9999999 && studentId < 100000000;
}
