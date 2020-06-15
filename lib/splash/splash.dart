import 'package:bt_mobile/constants/images.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'splash_presenter.dart';
import 'splash_view.dart';

class Splash extends StatefulWidget {
  const Splash(this.presenter, {Key key}) : super(key: key);

  final SplashPresenter presenter;

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends SplashView {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: C.darkBackground,
      child: FadeTransition(
        opacity: widget.presenter.animation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              child: Image.asset(I.biztech),
            ),
            const SizedBox(height: 30),
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(C.darkColor1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
