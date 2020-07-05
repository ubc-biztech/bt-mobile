import 'package:bt_mobile/splash/splash_presenter.dart';
import 'package:flutter/material.dart';

import 'constants/colors.dart';
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
      theme: ThemeData(
        primarySwatch: C.biztechColor,
        fontFamily: 'Proxima-Nova',
        unselectedWidgetColor: C.darkColor3,
        accentColor: C.darkColor1,
        errorColor: C.darkError,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: C.darkColor3),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: C.darkColor1),
          ),
        ),
      ),
      home: Splash(SplashPresenter()),
    );
  }
}
