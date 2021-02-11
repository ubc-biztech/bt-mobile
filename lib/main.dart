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
        cardColor: C.darkBackgroundCard,
        unselectedWidgetColor: C.darkColor3,
        accentColor: C.darkColor1,
        dividerColor: C.darkColor3,
        textTheme: TextTheme(
          headline5: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: C.darkColor1,
          ),
          headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: C.darkColor2,
          ),
          subtitle1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: C.darkColor2,
          ),
          bodyText2: TextStyle(color: C.darkColor2),
        ),
        errorColor: C.darkError,
        inputDecorationTheme: const InputDecorationTheme(
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
