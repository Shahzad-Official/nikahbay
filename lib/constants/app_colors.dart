import 'package:flutter/material.dart';

class AppColors {
  static const darkBg = Color(0xFF390026);
  static const darkColor = Color(0xff790252);
  static const primaryColor = Color.fromRGBO(175, 1, 113, 1);
  static const secondaryColor = Color(0xffE80F88);
  Map<int, Color> color = {
    50: Color.fromRGBO(175, 1, 113, .1),
    100: Color.fromRGBO(175, 1, 113, .2),
    200: Color.fromRGBO(175, 1, 113, .3),
    300: Color.fromRGBO(175, 1, 113, .4),
    400: Color.fromRGBO(175, 1, 113, .5),
    500: Color.fromRGBO(175, 1, 113, .6),
    600: Color.fromRGBO(175, 1, 113, .7),
    700: Color.fromRGBO(175, 1, 113, .8),
    800: Color.fromRGBO(175, 1, 113, .9),
    900: Color.fromRGBO(175, 1, 113, 1),
  };

  MaterialColor get customMaterialColor => MaterialColor(0xFFAF0171, color);
}
