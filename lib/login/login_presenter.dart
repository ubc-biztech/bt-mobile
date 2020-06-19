import 'package:bt_mobile/common/auth_manager.dart';
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
    final bool isSignedIn = await _authManager.signInWithFacebook(context);
    if (isSignedIn) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Main(MainPresenter())));
    }
  }

  Future onGoogleButtonPressed(BuildContext context) async {
    final bool isSignedIn = await _authManager.signInWithGoogle(context);
    if (isSignedIn) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Main(MainPresenter())));
    }
  }

  Future onAppleButtonPressed(BuildContext context) async {
    final bool isSignedIn = await _authManager.signInWithApple(context);
    if (isSignedIn) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Main(MainPresenter())));
    }
  }
}
