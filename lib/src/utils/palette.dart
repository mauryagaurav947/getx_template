import 'package:flutter/material.dart';

class Palette {
  Palette._();

  // Primary color swatches
  static const Map<int, Color> primaryColorSwatch = {
    50: Color.fromRGBO(0, 50, 98, .1),
    100: Color.fromRGBO(0, 50, 98, .2),
    200: Color.fromRGBO(0, 50, 98, .3),
    300: Color.fromRGBO(0, 50, 98, .4),
    400: Color.fromRGBO(0, 50, 98, .5),
    500: Color.fromRGBO(0, 50, 98, .6),
    600: Color.fromRGBO(0, 50, 98, .7),
    700: Color.fromRGBO(0, 50, 98, .8),
    800: Color.fromRGBO(0, 50, 98, .9),
    900: Color.fromRGBO(0, 50, 98, 1),
  };

  // Primary color
  static const MaterialColor primaryColor =
      MaterialColor(0xFF003262, primaryColorSwatch);

  /// White color
  static const Color white = Color(0xFFFFFFFF);

  /// White color
  static const Color black = Color(0xFF000000);

  //
  static const Color inputHintColor = Color(0xFFBBBCBB);

  /// Button overlayColor
  static const Color buttonOverlayColor = Color.fromRGBO(0, 0, 0, 0.05);

  /// Inactive color
  static const Color disabledColor = Color(0xFF5A5A5A);

  /// Border color
  static const Color borderColor = Color(0xFFE6E6E6);

  /// Error Border color
  static const Color errorColor = Color(0xFFB00020);

  /// Shadow color
  static const Color shadowColor = Color.fromRGBO(22, 22, 22, .15);

  // Primary color swatches
  static const Map<int, Color> darkPrimaryColorSwatch = {
    50: Color.fromRGBO(14, 21, 27, .1),
    100: Color.fromRGBO(14, 21, 27, .2),
    200: Color.fromRGBO(14, 21, 27, .3),
    300: Color.fromRGBO(14, 21, 27, .4),
    400: Color.fromRGBO(14, 21, 27, .5),
    500: Color.fromRGBO(14, 21, 27, .6),
    600: Color.fromRGBO(14, 21, 27, .7),
    700: Color.fromRGBO(14, 21, 27, .8),
    800: Color.fromRGBO(14, 21, 27, .9),
    900: Color.fromRGBO(14, 21, 27, 1),
  };

  static const MaterialColor darkPrimaryColor =
      MaterialColor(0xFF0E151B, darkPrimaryColorSwatch);
  static const Color darkAppBarColor = Color(0xFF29323D);
  static const Color darkCardColor = Color(0xFF0E0E0F);
  static const Color darkDividerColor = Color(0xFF545454);
  static const Color darkActiveColor = Color(0xFFFFFFFF);
  static const Color darkInactiveColor = Color(0xFF717B84);
}
