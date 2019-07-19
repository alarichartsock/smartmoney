import 'package:flutter/material.dart';

import 'custom_theme.dart';

// /*
// CustomThemeData for darkTheme. 
// Install Color Highlight for VSCode for easier viewing.
// */

// ThemeData darkTheme = new ThemeData(
//   primaryColorDark: Color(0xFF676767),//#676767
//   backgroundColor: Color(0xFF676767), //#676767
//   canvasColor: Color(0xFF8D8D8D), //#8d8d8d
//   splashColor: Color(0xFF8D8D8D), //#8d8d8d
//   dividerColor: Color(0xFFBEC0C0), //#BEC0C0
//   primaryColor: Color(0xFF00D594), //#00d594
//   accentColor: Color(0xFFF45531),  //#f45531

//   textTheme: TextTheme(
//     headline: TextStyle( //h2, unused 
//       color: Color(0xFFFFFFFF), //#ffffff
//       fontWeight: FontWeight.w300,
//       fontSize: 60.0,
//     ),
//     display4: TextStyle( //d4
//       color: Color(0xFFFFFFFF), //#ffffff
//       fontWeight: FontWeight.w400,
//       fontSize: 48.0,
//     ),
//     display3: TextStyle( //d3
//       color: Color(0xFFFFFFFF), //#ffffff
//       fontWeight: FontWeight.w400,
//       fontSize: 34.0,
//     ),
//     display2: TextStyle( //d2
//       color: Color(0xFFFFFFFF), //#ffffff
//       fontWeight: FontWeight.w400,
//       fontSize: 24.0,
//     ),
//     display1: TextStyle( //d1
//       color: Color(0xFFFFFFFF), //#ffffff
//       fontWeight: FontWeight.w400,
//       fontSize: 20.0,
//     ),
//     body1: TextStyle( //body1
//       color: Color(0xFFFFFFFF), //#ffffff
//       fontWeight: FontWeight.w400,
//       fontSize: 16.0,
//     ),
//     body2: TextStyle( //body2
//       color: Color(0xFFFFFFFF), //#ffffff
//       fontWeight: FontWeight.w400,
//       fontSize: 14.0,
//     ),
//     button: TextStyle( //For text buttons. Not for use on buttons.
//       color: Color(0xFF00D594), //#00d594
//       fontWeight: FontWeight.w700,
//       fontSize: 18.0,
//     ),
//     subtitle: TextStyle( //unused, do not delete.
//       color: Color(0xFFFFFFFF), //#ffffff
//       fontWeight: FontWeight.w400,
//       fontSize: 16.0,
//     ),
//     title: TextStyle( //unused, do not delete.
//       color: Color(0xFFE6EAEF), //#e6eaef
//       fontWeight: FontWeight.w400,
//       fontSize: 24.0,
//     ),
//   ),
// ); 


CustomThemeData darkTheme = CustomThemeData(
  primaryColor: Color(0xFF2DD8A4), //#2dd8a4
  accentColor: Color(0xFFF45531), //#f45531
  backgroundColor: Color(0xFF676767), //#676767
  firstContrast: Color(0xFFFFFFFF), //#ffffff
  secondaryContrast: Color(0xFFd4d4d4), //#D4D4D4
  thirdContrast: Color(0xFFb1b1b1), //##B1B1B1
  fourthContrast: Color(0xFFafafaf), //##AFAFAF
  canvasColor: Color(0xFF8D8D8D), //#8d8d8d
  textTheme: CustomTextTheme(
    h1: TextStyle(
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 96.0,
    ),
    h2: TextStyle(
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 60.0,
    ),
    h3: TextStyle(
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 48.0,
    ),
    h4: TextStyle(
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 34.0,
    ),
    h5: TextStyle(
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 24.0,
    ),
    h6: TextStyle(
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 20.0,
    ),
    subtitle1: TextStyle(
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
    ),
    subtitle2: TextStyle(
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body1: TextStyle(
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
    ),
    body2: TextStyle(
      color: Color(0xFFFFFFFF), //#ffffff
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    button: TextStyle(
      color: Color(0xFF21CE99),
      fontWeight: FontWeight.w700,
      fontSize: 18.0,
    ),
  )
);