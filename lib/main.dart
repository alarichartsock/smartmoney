import 'package:flutter/cupertino.dart'; //import libraries/"dependencies"
import 'package:flutter/material.dart';

import 'package:smartmoney/android/logic/theme/customTheme.dart';
import 'package:smartmoney/android/logic/theme/themes.dart';
import 'package:smartmoney/android/screens/info/order_screen.dart';
import 'android/screens/info/stock_screen.dart';
import 'package:smartmoney/android/screens/menu/help_screen.dart';
import 'package:smartmoney/android/screens/menu/settings_screen.dart';
import 'package:smartmoney/android/screens/signup/sign_up_screen.dart';

import 'android/screens/home/home_screen.dart'; //import Android specific classes.
import 'android/screens/onboarding_screen.dart';
import 'android/screens/menu/feedback_screen.dart' as FeedBackScreen; // Material has a class called Feedback, so importing as feedBackScreen
import 'android/screens/signin/sign_in_screen.dart'; 
import 'android/screens/terms.dart';
import 'android/screens/search_screen.dart';
import 'android/logic/data/order.dart';

bool runAndroid = true;

void main() => runApp(
    CustomTheme(
      child: (runAndroid == true) ? SmartMoneyAndroid() : SmartMoneyIOS(),
      initialThemeKey: MyThemeKeys.LIGHT,
    ));

class SmartMoneyIOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Onboarding(),
      theme: CupertinoThemeData(),
    );
  }
}

class SmartMoneyAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StockScreen(),
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
          '/terms': (BuildContext context) => Terms(),
          '/search': (BuildContext context) => Search()
        });
  }
}
