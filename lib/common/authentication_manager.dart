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
    final Tokens tokens = await Cognito.getTokens();
    return tokens.idToken;
  }

  ///
  Future<AuthenticationStatus> getAuthenticationStatus() async {
    if (!await Cognito.isSignedIn()) {
      return AuthenticationStatus.unauthenticated;
    }
    final User user = GetIt.I<User>();
    if (!user.isStudentIdValid) {
      return AuthenticationStatus.unregistered;
    }
    try {
      await Fetcher()
          .fetchBackend('/users/${user.studentId}', FetcherMethod.get);
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
    final bool isSuccessful = !await Cognito.isSignedIn();
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
        scopes: ['email', 'profile', 'openid'],
      );
    } catch (e) {
      print(e.toString());
    }
    await Future.delayed(const Duration(seconds: 1));
    await _registerUserSingleton();
    final AuthenticationStatus status = await getAuthenticationStatus();
    Navigator.pop(context);
    return status;
  }

  /// This is called when sign in is attempted. If we can instantiate a [User]
  /// object, register it as a global singleton to [GetIt]. If anything goes
  /// wrong, we sign the user out so that they can try logging in again.
  Future _registerUserSingleton() async {
    if (await Cognito.isSignedIn()) {
      try {
        final Tokens tokens = await Cognito.getTokens();
        final User user = User.fromIdToken(tokens.idToken);
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
      child: Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(C.darkColor1),
          ),
        ),
      ),
    );
  }
}
