import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/colors.dart';
import 'package:bt_mobile/constants/images.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:flutter/material.dart';

class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton(this.onPressed);

  final Function onPressed;

  static const double _iconPadding = (40.0 / 18.0 * 23.0) / 40.0 * 8.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          height: 24.0 + _iconPadding * 2,
          margin: const EdgeInsets.symmetric(horizontal: _iconPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 24.0 + _iconPadding * 2,
                width: 23.0,
                child: Image.asset(
                  I.apple,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(
                width: _iconPadding,
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    S.loginApple,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        fontSize: 18.0,
                        color: C.loginButtonFont),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4,
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton(this.onPressed);

  final Function onPressed;
  static const double _iconPadding = (40.0 / 18.0 * 23.0) / 40.0 * 8.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          height: 24.0 + _iconPadding * 2,
          margin: const EdgeInsets.symmetric(horizontal: _iconPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 23.0,
                width: 23.0,
                child: Image.asset(
                  I.google,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(
                width: _iconPadding,
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    S.loginGoogle,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        fontSize: 18.0,
                        color: C.loginButtonFont),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4,
    );
  }
}

class FacebookSignInButton extends StatelessWidget {
  const FacebookSignInButton(this.onPressed);

  final Function onPressed;

  static const double _iconPadding = (40.0 / 18.0 * 23.0) / 40.0 * 8.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: C.loginFacebookButton,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          height: 24.0 + _iconPadding * 2,
          margin: const EdgeInsets.symmetric(horizontal: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30.0,
                child: Image.asset(
                  I.facebook,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(
                width: _iconPadding,
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    S.loginFacebook,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        fontSize: 18.0,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4,
    );
  }
}
