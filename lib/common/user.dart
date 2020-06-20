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

  factory User.fromIdToken(String idToken) {
    final Map<String, dynamic> map = _parseJwt(idToken);
    if (map == null) {
      return null;
    }
    final String email = map['email'].toString();
    final List<String> name = map['name'].toString().split(' ').toList();
    final List<dynamic> groups = map['cognito:groups'].toList();
    final bool isAdmin =
        groups.contains('admin') || email.endsWith('@ubcbiztech.com');
    final String studentId = map['custom:student_id'];
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
    final String normalizedSource = base64Url.normalize(splitToken);
    return utf8.decode(base64Url.decode(normalizedSource));
  }

  String firstName;
  String lastName;
  String email;
  bool isAdmin;
  String studentId;
}
