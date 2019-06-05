import 'package:flutter/material.dart';

import '../../logic/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/styled_text_field.dart';
import '../components/styled_container.dart';

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
                  StyledContainer(
                    width: _containerWidth,
                    height: 9/41 * _containerWidth, //todo: modify value to a less grizzly number to scale dimensions better
                    verticalPadding: _margin,
                    horizontalPadding: _margin,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Text("Browse Trades.", style: blocData.textTheme.display1,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: _padding / 2),
                          child: Text("View largest trades made on the stock market.", style: blocData.textTheme.subtitle),
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
          )),
    );
  }
}