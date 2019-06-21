import 'package:flutter/material.dart';

/*
ThemeData for darkTheme. 
Install Color Highlight for VSCode for easier viewing.
*/

ThemeData darkTheme = new ThemeData(
  primaryColorDark: Color(0xFF676767),//#676767
  backgroundColor: Color(0xFF676767), //#676767
  canvasColor: Color(0xFF8D8D8D), //#8d8d8d
  splashColor: Color(0xFF8D8D8D), //#8d8d8d
  dividerColor: Color(0xFFBEC0C0), //#BEC0C0
  primaryColor: Color(0xFF00D594), //#00d594
  accentColor: Color(0xFFF45531),  //#f45531

  textTheme: TextTheme(
    headline: TextStyle( //h2, unused 
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w300,
      fontSize: 60.0,
    ),
    display4: TextStyle( //d4
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 48.0,
    ),
    display3: TextStyle( //d3
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 34.0,
    ),
    display2: TextStyle( //d2
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 24.0,
    ),
    display1: TextStyle( //d1
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 20.0,
    ),
    body1: TextStyle( //body1
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
    ),
    body2: TextStyle( //body2
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    button: TextStyle( //For text buttons. Not for use on buttons.
      color: Color(0xFF00D594), //#00d594
      fontWeight: FontWeight.w700,
      fontSize: 18.0,
    ),
    subtitle: TextStyle( //unused, do not delete.
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
    ),
    title: TextStyle( //unused, do not delete.
      color: Color(0xFFE6EAEF), //#e6eaef
      fontWeight: FontWeight.w400,
      fontSize: 24.0,
    ),
  ),
); 