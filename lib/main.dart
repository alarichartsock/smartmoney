import 'package:flutter/cupertino.dart'; //import libraries/"dependencies"
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';
import 'package:smartmoney/android/screens/menu/help_screen.dart';
import 'package:smartmoney/android/screens/menu/settings_screen.dart';
import 'package:smartmoney/android/screens/signup/sign_up_screen.dart';

import 'android/logic/theme/themebloc.dart'; //import global classes.
import 'android/screens/home/home_screen.dart'; //import Android specific classes.
import 'android/screens/onboarding_screen.dart';
import 'android/screens/menu/feedback_screen.dart'
    as FeedBackScreen;
import 'android/screens/signin/sign_in_screen.dart'; // Material has a class called Feedback, so importing as feedBackScreen

//todo: add import for iOS classes.

bool runAndroid = true;

void main() =>
    runApp((runAndroid == true) ? SmartMoneyAndroid() : SmartMoneyIOS());

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
          builder: (context, CustomThemeData theme) {
            return CupertinoApp(
                title: "Smartmoney iOS",
                home: Help() //todo: change to onboarding
                );
          },
        ));
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
          builder: (context, CustomThemeData theme) {
            return MaterialApp(
              //home: Onboarding(showImages: true),
              home: Home(),
              theme: ThemeData(
                accentColor: Color(0xFF21CE99), //#21ce99
              ),
              title: "Smartmoney Android",
              initialRoute: '/',
              routes: <String, WidgetBuilder> {
                '/settings': (BuildContext context) => Settings(),
                '/feedback' : (BuildContext context) => FeedBackScreen.Feedback(),
                '/help' :  (BuildContext context) => Help(),
                '/onboarding' : (BuildContext context) => Onboarding(showImages: true),
                '/onboardingprompt' : (BuildContext context) => Onboarding(showImages: false),
                '/signin' : (BuildContext context) => SignIn(),
                '/signup' : (BuildContext context) => SignUp(),
                '/home' : (BuildContext context) => Home(),
                }
            );
          },
        ));
  }
}
