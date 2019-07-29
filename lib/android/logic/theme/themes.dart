import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: Color(0xFF2DD8A4), //#2dd8a4
      accentColor: Color(0xFFF45531), //#f45531
      canvasColor: Color(0xFFFFFFFF), //#ffffff
      backgroundColor: Color(0xFFE6EAEF), //#ffe6eaef
      dividerColor: Color(0xFF343436), //#343436 substitute for first contrast
      cursorColor:Color(0xFF676767), //#676767 subtitute for secondary contrast
      focusColor: Color(0xFF707070), //#707070 substitute for third contrast
      hintColor: Color(0xFF8D8D8D), //#8d8d8d substitute for fourth contrast
      textTheme: TextTheme(
        display1: TextStyle(
            color: Color(0xFF000000), //#000000
            fontWeight: FontWeight.w400,
            fontSize: 48.0),
        display2: TextStyle(
            color: Color(0xFF000000), //#000000
            fontWeight: FontWeight.w400,
            fontSize: 34.0),
        display3: TextStyle(
            color: Color(0xFF000000), //#000000
            fontWeight: FontWeight.w400,
            fontSize: 24.0),
        display4: TextStyle(
            color: Color(0xFF000000), //#000000
            fontWeight: FontWeight.w400,
            fontSize: 16.0),
        title: TextStyle(
            color: Color(0xFF000000), //#000000,
            fontWeight: FontWeight.w400,
            fontSize: 20.0
        ),
        subtitle: TextStyle(
          color: Color(0xFF000000), //#000000
          fontWeight: FontWeight.w300,
          fontSize: 16.0,
        ),
        body1: TextStyle(
          color: Color(0xFF000000), //#000000
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
        body2: TextStyle(
            color: Color(0xFF000000),//#000000
            fontWeight: FontWeight.w400,
            fontSize: 14.0),
        button: TextStyle(
            color: Color(0xFF21CE99), //#21ce99
            fontWeight: FontWeight.w700,
            fontSize: 18.0),
      ));

  static final ThemeData darkTheme = ThemeData(
      primaryColor: Color(0xFF2DD8A4), //#2dd8a4
      accentColor: Color(0xFFF45531), //#f45531
      canvasColor: Color(0xFF8d8d8d), //#8d8d8d
      backgroundColor: Color(0xFF676767), //#676767
      dividerColor: Color(0xFFffffff), //#ffffff substitute for first contrast
      cursorColor:Color(0xFFd4d4d4), //#d4d4d4 subtitute for secondary contrast
      focusColor: Color(0xFFb1b1b1), //#b1b1b1 substitute for third contrast
      hintColor: Color(0xFF8D8D8D), //#8d8d8d substitute for fourth contrast
      textTheme: TextTheme(
        display1: TextStyle(
            color: Color(0xFFFFFFFF), //#ffffff
            fontWeight: FontWeight.w400,
            fontSize: 48.0),
        display2: TextStyle(
            color: Color(0xFFFFFFFF), //#ffffff
            fontWeight: FontWeight.w400,
            fontSize: 34.0),
        display3: TextStyle(
            color: Color(0xFFFFFFFF), //#ffffff
            fontWeight: FontWeight.w400,
            fontSize: 24.0),
        display4: TextStyle(
            color: Color(0xFFFFFFFF), //#ffffff
            fontWeight: FontWeight.w400,
            fontSize: 16.0),
        title: TextStyle(
            color: Color(0xFFFFFFFF), //#ffffff
            fontWeight: FontWeight.w400,
            fontSize: 20.0
        ),
        subtitle: TextStyle(
          color: Color(0xFFFFFFFF), //#ffffff
          fontWeight: FontWeight.w300,
          fontSize: 16.0,
        ),
        body1: TextStyle(
          color: Color(0xFFFFFFFF), //#ffffff
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
        body2: TextStyle(
            color: Color(0xFFFFFFFF), //#ffffff
            fontWeight: FontWeight.w400,
            fontSize: 14.0),
        button: TextStyle(
            color: Color(0xFFFFFFFF), //#21ce99
            fontWeight: FontWeight.w700,
            fontSize: 18.0),
      ));

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
