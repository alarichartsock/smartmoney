import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/industry_row.dart';
import 'package:smartmoney/android/components/styled_container.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';

import '.././../logic/theme/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/menu_button.dart';
import '../../logic/data/order.dart';

class OrderCardColumnScreen extends StatefulWidget {

  @override
  _OrderCardColumnScreenState createState() => _OrderCardColumnScreenState();
}

class _OrderCardColumnScreenState extends State<OrderCardColumnScreen> {

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);
    double _containerHeight = _screenHeight - 56.0 - (_margin * 4);
    const double _padding = 8.0;

    CustomThemeData customThemeData = BlocProvider.of<ThemeBloc>(context).currentState;

    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));

    return Container(
        color: customThemeData.backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, 56.0),
              child: AppBar(
                centerTitle: true,
                shape: appBarBorder,
                backgroundColor: customThemeData.canvasColor,
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Text("Robotics", style: customThemeData.textTheme.h4),
                      Text("122 stocks", style: customThemeData.textTheme.subtitle1),
                    ],
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    iconSize: 24.0,
                    icon:
                        Icon(Icons.remove_red_eye), //todo: add icon from icons8
                    color: customThemeData.primaryColor,
                    onPressed: () {
                      print("todo: open search");
                      print("$_screenWidth");
                    },
                  ),
                  IconButton(
                    iconSize: 24.0,
                    icon: Icon(Icons.search), //todo: add icon from icons8
                    color: customThemeData.primaryColor,
                    onPressed: () {
                      print("todo: open search");
                      print("$_screenWidth");
                    },
                  ),
                ],
                leading: IconButton(
                  iconSize: 36.0,
                  icon: Icon(Icons.arrow_left), //todo: add icon from icons8
                  color: customThemeData.primaryColor,
                  onPressed: () {
                    print("pressed.");
                  },
                ),
              )),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    StyledContainer(
                      width: _containerWidth,
                      height: _containerHeight + 28,
                      child: Column(
                        children: <Widget>[
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 6.0),
                                        child: Text("Robotics", style: customThemeData.textTheme.h3,),
                                      ),
                                      Text("View robotics related stocks", style: customThemeData.textTheme.subtitle1,),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, right: 16.0),
                                  child: IconButton(
                                    icon: Icon(Icons.settings),
                                    color: customThemeData.primaryColor,
                                    onPressed: () {
                                      print("pressed");
                                    },
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                
                              ],
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
