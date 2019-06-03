import 'package:flutter/material.dart';
import 'package:smartmoney/android/signup/sign_up.dart';

import './logic/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'android/dash/landing.dart';
import 'android/signin/sign_in.dart';
import 'android/onboarding.dart';

void main() => runApp(SmartMoneyAndroid()); 

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
          home: Onboarding()
          );
        },
      )
    );
  }
}