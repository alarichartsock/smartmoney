import 'package:flutter/cupertino.dart'; //import libraries/"dependencies"
import 'package:flutter/material.dart';
import 'package:smartmoney/android/signup/sign_up.dart';

import './logic/themebloc.dart'; //import global classes.
import 'package:flutter_bloc/flutter_bloc.dart';

import 'android/dash/landing.dart'; //import Android specific classes.
import 'android/signin/sign_in.dart';
import 'android/onboarding.dart';

//todo: add import for iOS classes.

bool runAndroid = true;

void main() => runApp((runAndroid == true) ? SmartMoneyAndroid() : SmartMoneyIOS());

class SmartMoneyIOS extends StatefulWidget {
  @override
  _SmartMoneyIOSState createState() => _SmartMoneyIOSState();
}

class _SmartMoneyIOSState extends State<SmartMoneyIOS> {

  final ThemeBloc themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: themeBloc,
      child: BlocBuilder(
        bloc: themeBloc,
        builder: (context,ThemeData theme) {
          return CupertinoApp( 
          title: "Smartmoney iOS",
          home: Landing() //todo: change to onboarding
          );
        },
      )
    );
  }
}

class SmartMoneyAndroid extends StatelessWidget {

  final ThemeBloc themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: themeBloc,
      child: BlocBuilder(
        bloc: themeBloc,
        builder: (context,ThemeData theme) {
          return MaterialApp( 
          title: "Smartmoney Android",
          home: Landing()
          );
        },
      )
    );
  }
}