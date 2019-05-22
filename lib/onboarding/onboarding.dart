import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> { //todo: stylize colors, stylize to look like onboarding page.
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

          ],
        ),
      ),
    ); 
  }
}