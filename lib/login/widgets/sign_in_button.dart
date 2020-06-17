import 'package:auto_size_text/auto_size_text.dart';
import 'package:bt_mobile/constants/images.dart';
import 'package:bt_mobile/constants/strings.dart';
import 'package:flutter/material.dart';

class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton(this.goToDestination);

  final Function goToDestination;

  @override
  Widget build(BuildContext context) {
    return _SignInButton(
      Colors.white,
      I.apple,
      S.apple_sign_in,
      const Color(0x8A000000),
      () {},
      isAppleIcon: true,
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton(this.goToDestination);

  final Function goToDestination;

  @override
  Widget build(BuildContext context) {
    return _SignInButton(
      Colors.white,
      I.google,
      S.google_sign_in,
      const Color(0x8A000000),
      () {},
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
      color: const Color(0xFF1877F2),
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
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    S.facebook_sign_in,
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

class _SignInButton extends StatelessWidget {
  const _SignInButton(
      this.color, this.iconAsset, this.text, this.fontColor, this.onPressed,
      {this.isAppleIcon = false});

  final Color color;
  final String iconAsset;
  final String text;
  final Color fontColor;
  final Function onPressed;
  final bool isAppleIcon;

  static const double _iconPadding = (40.0 / 18.0 * 23.0) / 40.0 * 8.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
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
                height: isAppleIcon ? 24.0 + _iconPadding * 2 : 23.0,
                width: 23.0,
                child: Image.asset(
                  iconAsset,
                  fit: isAppleIcon ? BoxFit.fitHeight : BoxFit.fitWidth,
                ),
              ),
              const SizedBox(
                width: _iconPadding,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    text,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        fontSize: 18.0,
                        color: fontColor),
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
