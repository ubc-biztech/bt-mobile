import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:bt_mobile/login/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';

import 'login_presenter.dart';
import 'login_view.dart';

class Login extends StatefulWidget {
  const Login(this.presenter, {Key key}) : super(key: key);

  final LoginPresenter presenter;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends LoginView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.darkBackground,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            constraints: const BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const AutoSizeText(
                    S.loginWelcome,
                    style: TextStyle(
                      fontSize: 44.0,
                      fontWeight: FontWeight.bold,
                      color: C.darkColor1,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  const AutoSizeText(
                    S.loginSalutation,
                    style: TextStyle(
                      height: 1.4,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: C.darkColor2,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 20.0),
                  GoogleSignInButton(() {}),
                  const SizedBox(height: 10.0),
                  FacebookSignInButton(() {}),
                  const SizedBox(height: 10.0),
                  AppleSignInButton(() {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
