import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/industry_row.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';
import 'package:smartmoney/android/screens/menu/settings_screen.dart';
import 'package:smartmoney/android/screens/onboarding_screen.dart';
import 'package:smartmoney/android/screens/transitions/slide_right.dart';
import '../menu/feedback_screen.dart' as feedback;
import '../menu/help_screen.dart';

import '.././../logic/theme/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/menu_button.dart';

/*
Home is the "main" screen that users will see.
Includes a scaffold and TabBarView.
*/

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);
    double _containerHeight = _screenHeight - 56.0 - (_margin * 4);
    const double _padding = 8.0;

    CustomThemeData customThemeData =
        BlocProvider.of<ThemeBloc>(context).currentState;

    TabController topController = TabController(length: 2, vsync: this);
    TabController bottomController = TabController(length: 3, vsync: this);

    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));

    Future<void> _signoutDialogue() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Sign out?',
              style: customThemeData.textTheme.h5,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Are you sure that you want to sign out?',
                    style: customThemeData.textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                textColor: customThemeData.primaryColor,
                child: Text(
                  'Cancel',
                  style: customThemeData.textTheme.button,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                textColor: customThemeData.thirdContrast,
                child: Text('Sign out',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: customThemeData.thirdContrast,
                        fontSize: 18.0)),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Onboarding(showImages: false,)
                    )
                  );
                  print(Navigator.of(context).toString());
                },
              )
            ],
          );
        },
      );
    }

    return Container(
      color: customThemeData.backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Container(
            width: _screenWidth * 4 / 10,
            height: _screenHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0)),
              child: Drawer(
                child: Container(
                  decoration: BoxDecoration(
                      color: customThemeData.canvasColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0))),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.arrow_left),
                                iconSize: 24.0,
                                color: customThemeData.primaryColor,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Text(
                                "BACK",
                                style: customThemeData.textTheme.button,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _screenHeight * 1 / 50),
                        child: Container(
                          width: _screenWidth * 1 / 3,
                          height: _screenHeight - (_screenHeight * 9 / 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              MenuButton(
                                size: 100,
                                icon: Icon(Icons.home),
                                title: "HOME",
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                selected: true,
                              ),
                              MenuButton(
                                size: 100,
                                icon: Icon(Icons.settings),
                                title: "SETTINGS",
                                onPressed: () {
                                  Navigator.push(context,
                                      SlideRightRoute(widget: Settings()));
                                },
                                selected: false,
                              ),
                              MenuButton(
                                size: 100,
                                icon: Icon(Icons.feedback),
                                title: "FEEDBACK",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      SlideRightRoute(
                                          widget: feedback.Feedback()));
                                },
                                selected: false,
                              ),
                              MenuButton(
                                size: 100,
                                icon: Icon(Icons.help),
                                title: "HELP",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      SlideRightRoute(
                                          widget: Help()));
                                },
                                selected: false,
                              ),
                              MenuButton(
                                size: 100,
                                icon: Icon(Icons.exit_to_app),
                                title: "SIGN OUT",
                                onPressed: () {
                                  print("signing out");
                                  _signoutDialogue();
                                },
                                selected: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 150.0),
            child: AppBar(
                centerTitle: true,
                shape: appBarBorder,
                backgroundColor: customThemeData.canvasColor,
                title: Text("smartmoney", style: customThemeData.textTheme.h6),
                actions: <Widget>[
                  IconButton(
                    iconSize: 24.0,
                    icon: Icon(Icons.search), //todo: add icon from icons8
                    color: customThemeData.primaryColor,
                    onPressed: () {
                      print("todo: open search");
                      print("$_screenWidth");
                    },
                  )
                ],
                leading: IconButton(
                  iconSize: 24.0,
                  icon: Icon(Icons.menu), //todo: add icon from icons8
                  color: customThemeData.primaryColor,
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                bottom: PreferredSize(
                  preferredSize: Size(_screenWidth, 150),
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        controller: topController,
                        labelColor: customThemeData.thirdContrast,
                        tabs: <Widget>[
                          Tab(
                            text: "BROWSE",
                          ),
                          Tab(
                            text: "WATCHLIST",
                          ),
                        ],
                      ),
                      TabBar(
                        controller: bottomController,
                        labelColor: customThemeData.thirdContrast,
                        tabs: <Widget>[
                          Tab(
                            text: "TRADES",
                          ),
                          Tab(
                            text: "OPTIONS",
                          ),
                          Tab(
                            text: "INSIDERS",
                          ),
                        ],
                      )
                    ],
                  ),
                )),
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
                      height: _screenWidth * 11 / 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
