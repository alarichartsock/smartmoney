import 'package:flutter/cupertino.dart'; //import libraries/"dependencies"
import 'package:flutter/material.dart';

import 'package:smartmoney/android/logic/theme/customTheme.dart';
import 'package:smartmoney/android/logic/theme/themes.dart';
import 'package:smartmoney/android/screens/menu/help_screen.dart';
import 'package:smartmoney/android/screens/menu/settings_screen.dart';
import 'package:smartmoney/android/screens/signup/sign_up_screen.dart';

import 'android/screens/home/home_screen.dart'; //import Android specific classes.
import 'android/screens/onboarding_screen.dart';
import 'android/screens/menu/feedback_screen.dart' as FeedBackScreen;
import 'android/screens/signin/sign_in_screen.dart'; // Material has a class called Feedback, so importing as feedBackScreen

bool runAndroid = true;

void main() => runApp(
    CustomTheme(
      child: Smartmoney(),
      initialThemeKey: MyThemeKeys.LIGHT,
    ));

// need to update ios section. 
// class SmartMoneyIOS extends StatefulWidget {
//   @override
//   _SmartMoneyIOSState createState() => _SmartMoneyIOSState();
// }

// class _SmartMoneyIOSState extends State<SmartMoneyIOS> {
//   final ThemeBloc themeBloc = ThemeBloc();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         bloc: themeBloc,
//         child: BlocBuilder(
//           bloc: themeBloc,
//           builder: (context, CustomThemeData theme) {
//             return CupertinoApp(
//                 title: "Smartmoney iOS",
//                 home: Help() //todo: change to onboarding
//                 );
//           },
//         ));
//   }
// }

class Smartmoney extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Onboarding(showImages: true),
        theme: CustomTheme.of(context),
        darkTheme: MyThemes.darkTheme,
        title: "Smartmoney Android",
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/settings': (BuildContext context) => Settings(),
          '/feedback': (BuildContext context) => FeedBackScreen.Feedback(),
          '/help': (BuildContext context) => Help(),
          '/onboarding': (BuildContext context) => Onboarding(showImages: true),
          '/onboardingprompt': (BuildContext context) =>
              Onboarding(showImages: false),
          '/signin': (BuildContext context) => SignIn(),
          '/signup': (BuildContext context) => SignUp(),
          '/home': (BuildContext context) => Home(),
        });
  }
}
