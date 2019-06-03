import 'package:flutter/material.dart';

import '../components/styled_text_field.dart';

import '../../logic/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    ThemeData blocData = BlocProvider.of<ThemeBloc>(context).currentState;

    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));

    return Container(
      color: blocData.backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 56.0),
            child: AppBar(         
              centerTitle: true,
              shape: appBarBorder,
              backgroundColor: blocData.canvasColor,
              title: Text("smartmoney",style: blocData.textTheme.display1),
              actions: <Widget>[
                IconButton(
                  iconSize: 24.0,
                  icon: Icon(Icons.search), //todo: add icon from icons8
                  color: blocData.primaryColor,
                  onPressed: () {
                    print("todo: open search");
                  },
                )
              ],
              leading: IconButton(
                iconSize: 24.0,
                icon: Icon(Icons.menu), //todo: add icon from icons8
                color: blocData.primaryColor,
                onPressed: () {
                  print("todo: open menu");},
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          extendBody: false,
          backgroundColor: Colors.transparent,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: _margin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Material(
                  borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                  elevation: 5.0,
                  child: Container(
                    width: _containerWidth,
                    height: _containerWidth - (_margin * 2.5),
                    decoration: BoxDecoration(
                        color: blocData.canvasColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          
                        ],
                      ),
                    ),
                  ),
                ),
                ],
              ),
            ),
          )),
    );
  }
}