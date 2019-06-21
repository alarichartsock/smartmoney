import 'package:flutter/cupertino.dart'; //import libraries/"dependencies"
import 'package:flutter/material.dart';

import './android/logic/theme/themebloc.dart'; //import global classes.
import 'package:flutter_bloc/flutter_bloc.dart';

import 'android/screens/landing_screen.dart'; //import Android specific classes.
import 'android/screens/onboarding.dart';

import './android/logic/theme/darkTheme.dart';

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
            theme: ThemeData(
              accentColor: Color(0xFF21CE99), //#21ce99
            ),
          title: "Smartmoney Android",
          home: Landing()
          );
        },
      )
    );
  }
}