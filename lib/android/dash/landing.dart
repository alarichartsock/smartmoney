import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/industry_card.dart';
import 'package:smartmoney/android/components/industry_row.dart';

import '../../logic/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/styled_container.dart';
import '../components/trade_card.dart';
import '../components/trade_column.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    //Fetching height and width values of device
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    //Left and right margins of the screen.
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);
    double _containerHeight = _screenHeight - 56.0 - (_margin * 4);
    const double _padding = 8.0;

    //Storing theme as a variable to prevent long lines. This may or may not work. If theme doesn't work, change this first.
    ThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;

    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));

    return Container(
      color: themeData.backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 56.0),
          child: AppBar(
            centerTitle: true,
            shape: appBarBorder,
            backgroundColor: themeData.canvasColor,
            title: Text("smartmoney", style: themeData.textTheme.display1),
            actions: <Widget>[
              IconButton(
                iconSize: 24.0,
                icon: Icon(Icons.search), //todo: add icon from icons8
                color: themeData.primaryColor,
                onPressed: () {
                  print("todo: open search");
                  print("$_screenWidth");
                },
              )
            ],
            leading: IconButton(
              iconSize: 24.0,
              icon: Icon(Icons.menu), //todo: add icon from icons8
              color: themeData.primaryColor,
              onPressed: () {
                print("todo: open menu");

              },
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        extendBody: false,
        backgroundColor: Colors.transparent,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IndustryRow(
                    width: _screenWidth,
                    height: _screenWidth * 11/20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
