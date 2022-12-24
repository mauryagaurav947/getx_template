import 'package:flutter/material.dart';
import 'package:getx_template/src/config/font_sizes.dart';
import 'package:getx_template/src/utils/palette.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  ThemeConfig._();

  /// Light style
  static ThemeData get lightTheme {
    return ThemeData(
      // useMaterial3: true,
      primaryColor: Palette.primaryColor,
      primarySwatch: Palette.primaryColor,
      scaffoldBackgroundColor: Palette.white,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.notoSans().fontFamily,
      disabledColor: Palette.disabledColor,
      indicatorColor: Palette.primaryColor,
      inputDecorationTheme: _inputDecorationTheme,
      textTheme: GoogleFonts.notoSansTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
            Palette.primaryColor,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Palette.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// App theme data
  ///
  static ThemeData get darkTheme {
    return ThemeData(
      // useMaterial3: true,
      primaryColor: Palette.darkPrimaryColor,
      primarySwatch: Colors.cyan,
      scaffoldBackgroundColor: Palette.darkPrimaryColor,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.notoSans().fontFamily,
      cardColor: Palette.darkCardColor,
      disabledColor: Palette.darkInactiveColor,
      dividerColor: Palette.darkDividerColor,
      indicatorColor: Palette.darkActiveColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Palette.darkAppBarColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Palette.darkAppBarColor,
      ),
      inputDecorationTheme: _darkInputDecorationTheme,
      textTheme: GoogleFonts.notoSansTextTheme().copyWith(
        bodyText1: const TextStyle(color: Palette.white),
        bodyText2: const TextStyle(color: Palette.white),
        button: const TextStyle(color: Palette.white),
        headline6: const TextStyle(color: Palette.white),
        headline5: const TextStyle(color: Palette.white),
        headline4: const TextStyle(color: Palette.white),
        headline3: const TextStyle(color: Palette.white),
        headline2: const TextStyle(color: Palette.white),
        headline1: const TextStyle(color: Palette.white),
        caption: const TextStyle(color: Palette.white),
        overline: const TextStyle(color: Palette.white),
        subtitle1: const TextStyle(color: Palette.white),
        subtitle2: const TextStyle(color: Palette.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
            Palette.primaryColor,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Palette.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: Palette.borderColor,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: Palette.borderColor,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: Palette.primaryColor,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: Palette.errorColor,
        width: 2,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    hintStyle: const TextStyle(
      color: Palette.inputHintColor,
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.body1,
    ),
    labelStyle: const TextStyle(
      color: Palette.inputHintColor,
    ),
    filled: true,
    fillColor: Palette.white,
  );

  static final InputDecorationTheme _darkInputDecorationTheme =
      InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    hintStyle: const TextStyle(
      color: Palette.inputHintColor,
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.body1,
    ),
    labelStyle: const TextStyle(
      color: Palette.inputHintColor,
    ),
    filled: true,
    fillColor: Palette.primaryColor.shade200,
  );
}
