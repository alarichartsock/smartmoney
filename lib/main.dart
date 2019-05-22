import 'package:flutter/material.dart';

import './theme/darkTheme.dart';
import './theme/lightTheme.dart';

import './onboarding/onboarding.dart';

void main() => runApp(Smartmoney()); //entry point for smartmoney

class Smartmoney extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //todo: add blocprovider, and add bloc package to pubspec.
      title: 'Smartmoney',
      home: Onboarding() 
    );
  }
}

