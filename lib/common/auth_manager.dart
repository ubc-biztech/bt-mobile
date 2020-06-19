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

  Future signInWithFacebook() async {
    try {
      await Cognito.showSignIn(
        identityProvider: 'Facebook',
        scopes: ['email', 'profile', 'openid'],
      );
    } catch (e) {
      print(e.toString());
    }
    return await Cognito.isSignedIn();
  }

  Future<bool> signInWithGoogle() async {
    try {
      await Cognito.showSignIn(
        identityProvider: 'Google',
        scopes: ['email', 'profile', 'openid'],
      );
    } catch (e) {
      print(e.toString());
    }
    return await Cognito.isSignedIn();
  }

  Future<bool> signInWithApple() async {
    try {
      await Cognito.showSignIn(
        identityProvider: 'Apple',
        scopes: ['email', 'profile', 'openid'],
      );
    } catch (e) {
      print(e.toString());
    }
    return await Cognito.isSignedIn();
  }
}
