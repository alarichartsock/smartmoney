import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/industry_row.dart';

import '../././logic/theme/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '.././components/menu_button.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> with TickerProviderStateMixin {
  
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);
    double _containerHeight = _screenHeight - 56.0 - (_margin * 4);
    const double _padding = 8.0;

    ThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;

    TabController topController = TabController(length: 2, vsync: this);
    TabController bottomController = TabController(length: 3, vsync: this);

    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));


    return Container(
      color: themeData.backgroundColor,
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
                      color: themeData.canvasColor,
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
                                color: themeData.primaryColor,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Text(
                                "BACK",
                                style: themeData.textTheme.button,
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
                                  print("opened");
                                },
                                selected: true,
                              ),
                              MenuButton(
                                size: 100,
                                icon: Icon(Icons.settings),
                                title: "SETTINGS",
                                onPressed: () {
                                  print("opened");
                                },
                                selected: false,
                              ),
                              MenuButton(
                                size: 100,
                                icon: Icon(Icons.feedback),
                                title: "FEEDBACK",
                                onPressed: () {
                                  print("opened");
                                },
                                selected: false,
                              ),
                              MenuButton(
                                size: 100,
                                icon: Icon(Icons.help),
                                title: "HELP",
                                onPressed: () {
                                  print("opened");
                                },
                                selected: false,
                              ),
                              MenuButton(
                                size: 100,
                                icon: Icon(Icons.exit_to_app),
                                title: "SIGN OUT",
                                onPressed: () {
                                  print("opened");
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
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                bottom: PreferredSize(
                  preferredSize: Size(_screenWidth, 150),
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        controller: topController,
                        labelColor: themeData.primaryColorDark,
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
                        labelColor: themeData.primaryColorDark,
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
