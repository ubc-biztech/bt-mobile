import 'package:bt_mobile/common/user.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cognito_plugin/flutter_cognito_plugin.dart';
import 'package:get_it/get_it.dart';

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
    if (isSignedIn) {
      final Tokens tokens = await Cognito.getTokens();
      final User user = User.fromIdToken(tokens.idToken);
      GetIt.I.registerSingleton<User>(user);
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
    if (isSuccessful) {
      GetIt.I.unregister(instance: GetIt.I<User>());
    }
    Navigator.pop(context); // dismiss loading dialog
    return isSuccessful;
  }

  Future<bool> signInWithFacebook(BuildContext context) async {
    return _signIn('Facebook', context);
  }

  Future<bool> signInWithGoogle(BuildContext context) async {
    return _signIn('Google', context);
  }

  Future<bool> signInWithApple(BuildContext context) async {
    return _signIn('Apple', context);
  }

  /// Show a loading dialog so that users can't do any additional actions while
  /// we load. If we can't generate a [User]  from the idToken, then sign out.
  /// Register the [User] singleton to [GetIt] and close the dialog by calling
  /// [Navigator.pop].
  Future<bool> _signIn(String provider, BuildContext context) async {
    _showLoadingDialog(context);
    try {
      await Cognito.showSignIn(
        identityProvider: provider,
        scopes: ['email', 'profile', 'openid'],
      );
    } catch (e) {
      print(e.toString());
    }
    await Future.delayed(const Duration(seconds: 1));
    bool isSuccessful = await Cognito.isSignedIn();
    final Tokens tokens = await Cognito.getTokens();
    final User user = User.fromIdToken(tokens.idToken);
    isSuccessful = isSuccessful && user != null;
    if (isSuccessful) {
      GetIt.I.registerSingleton<User>(user);
    } else {
      try {
        await Cognito.signOut();
      } catch (e) {
        print(e.toString());
      }
    }
    Navigator.pop(context);
    return isSuccessful;
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
