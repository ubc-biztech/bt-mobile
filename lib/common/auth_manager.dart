import 'package:bt_mobile/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cognito_plugin/flutter_cognito_plugin.dart';

class AuthManager {
  /// Get the [SharedPreferences] instance in preparation to get or save local
  /// data. Attempt to pull data from GitHub, and if anything goes wrong,
  /// default to the data that was saved to the device. Return true if there is
  /// data to show. Return false if there is no data to show.
  Future<bool> setupAuthManager() async {
    bool isSignedIn = false;
    try {
      await Cognito.initialize();
      isSignedIn = await Cognito.isSignedIn();
    } catch (e) {
      // do nothing
    }
    return isSignedIn;
  }

  /// Added 1 second delays to all sign in and sign out actions because there
  /// seems to be a lingering race condition, even when we wait for the previous
  /// operation to finish.
  Future<bool> signOut(BuildContext context) async {
    _showLoadingDialog(context);
    try {
      await Cognito.signOut();
    } catch (e) {
      print(e.toString());
    }
    await Future.delayed(const Duration(seconds: 1));
    final bool isSuccessful = !await Cognito.isSignedIn();
    Navigator.pop(context); // dismiss loading dialog
    return isSuccessful;
  }

  Future<String> signInWithFacebook(BuildContext context) async {
    _showLoadingDialog(context);
    try {
      await Cognito.showSignIn(
        identityProvider: 'Facebook',
        scopes: ['email', 'profile', 'openid'],
      );
    } catch (e) {
      print(e.toString());
    }
    await Future.delayed(const Duration(seconds: 1));
    final bool isSuccessful = await Cognito.isSignedIn();
    final Tokens tokens = await Cognito.getTokens();
    Navigator.pop(context); // dismiss loading dialog
    return isSuccessful ? tokens.idToken : null;
  }

  Future<String> signInWithGoogle(BuildContext context) async {
    _showLoadingDialog(context);
    try {
      await Cognito.showSignIn(
        identityProvider: 'Google',
        scopes: ['email', 'profile', 'openid'],
      );
    } catch (e) {
      print(e.toString());
    }
    await Future.delayed(const Duration(seconds: 1));
    final bool isSuccessful = await Cognito.isSignedIn();
    final Tokens tokens = await Cognito.getTokens();
    Navigator.pop(context); // dismiss loading dialog
    return isSuccessful ? tokens.idToken : null;
  }

  Future<String> signInWithApple(BuildContext context) async {
    _showLoadingDialog(context);
    try {
      await Cognito.showSignIn(
        identityProvider: 'Apple',
        scopes: ['email', 'profile', 'openid'],
      );
    } catch (e) {
      print(e.toString());
    }
    await Future.delayed(const Duration(seconds: 1));
    final bool isSuccessful = await Cognito.isSignedIn();
    final Tokens tokens = await Cognito.getTokens();
    Navigator.pop(context); // dismiss loading dialog
    return isSuccessful ? tokens.idToken : null;
  }

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
