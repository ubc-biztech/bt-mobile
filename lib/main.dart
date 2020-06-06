import 'package:bt_mobile/splash/splash_presenter.dart';
import 'package:flutter/material.dart';

import 'constants/strings.dart';
import 'splash/splash.dart';

void main() {
  runApp(BizTechMobile());
}

class BizTechMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: S.title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Proxima-Nova'),
      home: Splash(SplashPresenter()),
    );
  }
}
