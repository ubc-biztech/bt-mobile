import 'package:bt_mobile/common/user.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cognito_plugin/flutter_cognito_plugin.dart';
import 'package:get_it/get_it.dart';

import 'backend_request.dart';

enum AuthenticationStatus { registered, unregistered, unauthenticated }

enum SignInProvider { google, facebook, apple }

class AuthenticationManager {
  Future<AuthenticationStatus> setupAuthManager() async {
    try {
      await Cognito.initialize();
      await _registerUserSingleton();
    } catch (e) {
      // do nothing
    }
    return await getAuthenticationStatus();
  }

  Future<String> get jwtToken async {
    Tokens tokens = await Cognito.getTokens();
    return tokens.idToken;
  }

  /// Submits the user details from the "New Member" registration form.
  ///
  /// Errors are not handled here, so they must be caught by whatever calls this
  /// method. If the POST call works, update the user attributes to include the
  /// student_id.
  Future submitUserDetails(BuildContext context, {bool isPost = true}) async {
    _showLoadingDialog(context);
    User user = GetIt.I<User>();
    try {
      // Run asynchronously
      String endpoint = '/users';
      if (!isPost) {
        endpoint += '/${user.studentId}';
      }
      await Future.wait([
        Cognito.updateUserAttributes(
            {'custom:student_id': '${user.studentId}'}),
        Fetcher().fetchBackend(
            endpoint, isPost ? FetcherMethod.post : FetcherMethod.patch,
            data: user.userDetails),
      ]);
    } finally {
      Navigator.pop(context);
    }
  }

  /// Determine what the authentication status of the current user is.
  ///
  /// [AuthenticationStatus.unauthenticated]
  ///  - The user is not signed in with any of the social media providers.
  ///
  /// [AuthenticationStatus.unregistered]
  ///  - The user is signed in with one of the social media providers.
  ///  - The user has not filled out of the "New Member" registration form.
  ///  - The user managed to have a malformed Student ID, so they must re-do the
  ///    "New Member" registration form.
  ///
  /// [AuthenticationStatus.registered]
  ///  - The user is signed in with one of the social media providers.
  ///  - The user has filled out the "New Member" registration form.
  ///  - The user's details are valid, including Student ID, they all G.
  Future<AuthenticationStatus> getAuthenticationStatus() async {
    if (!await Cognito.isSignedIn()) {
      return AuthenticationStatus.unauthenticated;
    }
    User user = GetIt.I<User>();
    if (!user.isStudentIdValid) {
      return AuthenticationStatus.unregistered;
    }
    try {
      Map<String, dynamic> userResponseBody = (await Fetcher()
              .fetchBackend('/users/${user.studentId}', FetcherMethod.get))
          .cast<String, dynamic>();
      user.updateUserDetailsFromMap(userResponseBody);
      await user.fetchRegisteredEvents();
      return AuthenticationStatus.registered;
    } catch (e) {
      try {
        // This means that the user does not exist in the user pool.
        await Cognito.updateUserAttributes({'custom:student_id': ''});
      } catch (e) {
        // If this doesn't work, oh well.
      }
      return AuthenticationStatus.unregistered;
    }
  }

  /// Signs the user out of their account and unregisters the [User] singleton.
  ///
  /// Added 1 second delays to all sign in and sign out actions because there
  /// seems to be a lingering race condition, even when we [await] for the
  /// previous operation to finish.
  Future<bool> signOut(BuildContext context) async {
    _showLoadingDialog(context);
    try {
      await Cognito.signOut();
    } catch (e) {
      print(e.toString());
    }
    await Future.delayed(const Duration(seconds: 1));
    bool isSuccessful = !await Cognito.isSignedIn();
    if (isSuccessful) {
      GetIt.I.unregister(instance: GetIt.I<User>());
    }
    Navigator.pop(context); // dismiss loading dialog
    return isSuccessful;
  }

  Future<AuthenticationStatus> signInWithFacebook(BuildContext context) async {
    return _signIn(SignInProvider.facebook, context);
  }

  Future<AuthenticationStatus> signInWithGoogle(BuildContext context) async {
    return _signIn(SignInProvider.google, context);
  }

  Future<AuthenticationStatus> signInWithApple(BuildContext context) async {
    return _signIn(SignInProvider.apple, context);
  }

  /// Signs the user in with their [SignInProvider].
  ///
  /// Show a loading dialog so that users can't do any additional actions while
  /// we load. If we can't generate a [User] from the idToken, then sign out.
  /// Register the [User] singleton to [GetIt] and close the dialog by calling
  /// [Navigator.pop].
  Future<AuthenticationStatus> _signIn(
      SignInProvider provider, BuildContext context) async {
    _showLoadingDialog(context);
    String providerString;
    switch (provider) {
      case SignInProvider.apple:
        providerString = 'Apple';
        break;
      case SignInProvider.google:
        providerString = 'Google';
        break;
      case SignInProvider.facebook:
        providerString = 'Facebook';
        break;
    }
    try {
      await Cognito.showSignIn(
        identityProvider: providerString,
        scopes: ['email', 'profile', 'openid', 'aws.cognito.signin.user.admin'],
      );
    } catch (e) {
      print(e.toString());
    }
    await Future.delayed(const Duration(seconds: 1));
    await _registerUserSingleton();
    AuthenticationStatus status = await getAuthenticationStatus();
    Navigator.pop(context);
    return status;
  }

  /// Registers a globally accessible [User] singleton if signed in.
  ///
  /// This is called when sign in is attempted. If we can instantiate a [User]
  /// object, register it as a global singleton to [GetIt]. If anything goes
  /// wrong, we sign the user out so that they can try logging in again.
  Future _registerUserSingleton() async {
    if (await Cognito.isSignedIn()) {
      try {
        Tokens tokens = await Cognito.getTokens();
        Map<String, String> userAttributes = await Cognito.getUserAttributes();
        User user =
            User.fromIdTokenAndUserAttributes(tokens.idToken, userAttributes);
        GetIt.I.registerSingleton<User>(user);
      } catch (e) {
        await Cognito.signOut();
      }
    }
  }

  /// The loading dialog takes up the whole screen. It must be dismissed by
  /// popping the context off with [Navigator.pop].
  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(C.darkColor1),
            ),
          ),
        ),
      ),
    );
  }
}
