import 'package:bt_mobile/common/authentication_manager.dart';
import 'package:bt_mobile/landing/landing.dart';
import 'package:bt_mobile/landing/landing_presenter.dart';
import 'package:bt_mobile/member_info/member_info.dart';
import 'package:bt_mobile/member_info/member_info_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../base/presenter.dart';
import 'login.dart';
import 'login_model.dart';
import 'login_view.dart';

class LoginPresenter extends Presenter<LoginView, LoginModel> {
  LoginPresenter() {
    model = LoginModel();
  }

  final AuthenticationManager _authManager = GetIt.I<AuthenticationManager>();

  Future onFacebookButtonPressed(BuildContext context) async {
    AuthenticationStatus status =
        await _authManager.signInWithFacebook(context);
    onSignInAttempt(status, context);
  }

  Future onGoogleButtonPressed(BuildContext context) async {
    AuthenticationStatus status = await _authManager.signInWithGoogle(context);
    onSignInAttempt(status, context);
  }

  Future onAppleButtonPressed(BuildContext context) async {
    AuthenticationStatus status = await _authManager.signInWithApple(context);
    onSignInAttempt(status, context);
  }

  void onSignInAttempt(AuthenticationStatus status, BuildContext context) {
    switch (status) {
      case AuthenticationStatus.registered:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Landing(LandingPresenter()),
          ),
        );
        break;
      case AuthenticationStatus.unregistered:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NewMember(NewMemberPresenter()),
          ),
        );
        break;
      case AuthenticationStatus.unauthenticated:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(LoginPresenter()),
          ),
        );
        break;
    }
  }
}
