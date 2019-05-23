import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> { //todo: stylize colors, stylize to look like onboarding page.

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.width; //fetching width and height values of device
    double width = MediaQuery.of(context).size.height;

    return Scaffold( 
      body: Container(
        color: Color(0xFFE6EAEF), //tood: pair color to flutter BLoC theme provider
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Container(),
            Container(
              child: Column(
                children: <Widget>[
                  Text("Trade smart"),
                  Text("Filter stocks by metrics like short interest and short interest change"),
                  Row(
                    children: <Widget>[
                      Container(),
                      Container(),
                      Text("NEXT")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ); 
  }
}