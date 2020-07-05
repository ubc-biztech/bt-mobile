import 'dart:ui';

import 'package:flutter/material.dart';

class C {
  static const Color morningBackground = Color(0xFFfff4d1);
  static const Color dayBackground = Color(0xFFeff3f8);
  static const Color bizTechGrey = Color(0xFF59595B);

  /// Dark Mode Colors
  static const Color darkBackground = Color(0xFF070F21);
  static const Color darkBackgroundCard = Color(0xFF273149);
  static const Color darkColor1 = Color(0xFF96FF50);
  static const Color darkColor2 = Color(0xFFFFFFFF);
  static const Color darkColor3 = Color(0xFFAEC4F4);
  static const Color darkError = Color(0xFFFFADBC);

  /// Login
  static const Color loginButtonFont = Color(0x8A000000);
  static const Color loginFacebookButton = Color(0xFF1877F2);

  static const MaterialColor biztechColor = MaterialColor(
    0xFF96FF50,
    <int, Color>{
      50: Color(0xFFf0ffe5),
      100: Color(0xFFd1ffb3),
      200: Color(0xFFb6ff85),
      300: Color(0xFFabff73),
      400: Color(0xFFa1ff62),
      500: C.darkColor1,
      600: Color(0xFF5ce600),
      700: Color(0xFF338000),
      800: Color(0xFF1f4d00),
      900: Color(0xFF0a1a00),
    },
  );
}
