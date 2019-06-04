import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './logic/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'android/dash/landing.dart';

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
          title: "Smartmoney",
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
          title: "Smartmoney",
          home: Landing()
          );
        },
      )
    );
  }
}