import 'package:flutter/material.dart';

class CustomThemeData {

  CustomTextTheme textTheme;
  Color backgroundColor;
  Color canvasColor;
  Color primaryColor;
  Color accentColor;
  Color firstContrast;
  Color secondaryContrast;
  Color thirdContrast;
  Color fourthContrast;


  CustomThemeData({
    this.textTheme,
    this.backgroundColor,
    this.canvasColor,
    this.primaryColor,
    this.accentColor,
    this.firstContrast,
    this.secondaryContrast,
    this.thirdContrast,
    this.fourthContrast
  });
}

class CustomTextTheme {

  TextStyle h1;
  TextStyle h2;
  TextStyle h3;
  TextStyle h4;
  TextStyle h5;
  TextStyle h6;
  TextStyle subtitle1;
  TextStyle subtitle2;
  TextStyle body1;
  TextStyle body2;
  TextStyle button;


  CustomTextTheme({
    this.h1,
    this.h2,
    this.h3,
    this.h4,
    this.h5,
    this.h6,
    this.subtitle1,
    this.subtitle2,
    this.body1,
    this.body2,
    this.button
  });
}