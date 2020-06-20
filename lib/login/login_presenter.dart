import 'package:bt_mobile/common/auth_manager.dart';
import 'package:bt_mobile/common/user.dart';
import 'package:bt_mobile/main/main.dart';
import 'package:bt_mobile/main/main_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../base/presenter.dart';
import 'login_model.dart';
import 'login_view.dart';

class LoginPresenter extends Presenter<LoginView, LoginModel> {
  LoginPresenter() {
    model = LoginModel();
  }

  final AuthManager _authManager = GetIt.I<AuthManager>();

  Future onFacebookButtonPressed(BuildContext context) async {
    final String idToken = await _authManager.signInWithFacebook(context);
    _onSignInAttempt(idToken, context);
  }

  Future onGoogleButtonPressed(BuildContext context) async {
    final String idToken = await _authManager.signInWithGoogle(context);
    _onSignInAttempt(idToken, context);
  }

  Future onAppleButtonPressed(BuildContext context) async {
    final String idToken = await _authManager.signInWithApple(context);
    _onSignInAttempt(idToken, context);
  }

  void _onSignInAttempt(String idToken, BuildContext context) {
    final User user = User.fromIdToken(idToken);
    if (user == null) {
      return;
    }
    GetIt.I.registerSingleton<User>(user);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Main(MainPresenter())));
  }
}
