import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/industry_row.dart';
import 'package:smartmoney/android/components/order_column.dart';
import 'package:smartmoney/android/components/title_card.dart';
import 'package:smartmoney/android/components/trade_endless_column.dart';
import 'package:smartmoney/android/logic/data/order.dart';
import 'package:smartmoney/android/screens/menu/settings_screen.dart';
import '../menu/feedback_screen.dart' as feedback;
import '../menu/help_screen.dart';

import '../../components/menu_button.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRightRoute({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return new SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        });
}

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
            backgroundColor: Theme.of(context).backgroundColor,
            title: Text(
              'Sign out?',
              style: Theme.of(context).textTheme.display3,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Are you sure that you want to sign out?',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                textColor: Theme.of(context).focusColor,
                child: Text('Sign out',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).cursorColor,
                        fontSize: 18.0)),
                onPressed: () {
                  print(Navigator.of(context).toString());
                  Navigator.of(context).popUntil(ModalRoute.withName("/"));
                  Navigator.of(context).pushNamed('/onboardingprompt');
                },
              )
            ],
          );
        },
      );
    }

    return Container(
      color: Theme.of(context).backgroundColor,
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
                      color: Theme.of(context).canvasColor,
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
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  print(Navigator.of(context).toString());
                                  Navigator.pop(context);
                                },
                              ),
                              Text(
                                "BACK",
                                style: Theme.of(context).textTheme.button,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _screenHeight * 1 / 100),
                        child: Container(
                          width: _screenWidth * 1 / 3,
                          height: _screenHeight * 0.83,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              MenuButton(
                                size: 95,
                                icon: Icon(Icons.home),
                                title: "HOME",
                                onPressed: () {
                                  print(Navigator.of(context).toString());
                                  Navigator.pop(context);
                                },
                                selected: true,
                              ),
                              MenuButton(
                                size: 95,
                                icon: Icon(Icons.settings),
                                title: "SETTINGS",
                                onPressed: () {
                                  print(Navigator.of(context).toString());
                                  Navigator.push(
                                      context,
                                      SlideRightRoute(
                                          widget: Settings(darkThemeOn: true)));
                                },
                                selected: false,
                              ),
                              MenuButton(
                                size: 95,
                                icon: Icon(Icons.feedback),
                                title: "FEEDBACK",
                                onPressed: () {
                                  print(Navigator.of(context).toString());
                                  Navigator.push(
                                      context,
                                      SlideRightRoute(
                                          widget: feedback.Feedback()));
                                },
                                selected: false,
                              ),
                              MenuButton(
                                size: 95,
                                icon: Icon(Icons.help),
                                title: "HELP",
                                onPressed: () {
                                  print(Navigator.of(context).toString());
                                  Navigator.push(
                                      context, SlideRightRoute(widget: Help()));
                                },
                                selected: false,
                              ),
                              MenuButton(
                                size: 95,
                                icon: Icon(Icons.exit_to_app),
                                title: "SIGN OUT",
                                onPressed: () {
                                  print(Navigator.of(context).toString());
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
                backgroundColor: Theme.of(context).canvasColor,
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("smartmoney",
                      style: Theme.of(context).textTheme.display4),
                ),
                actions: <Widget>[
                  IconButton(
                    iconSize: 24.0,
                    icon: Icon(Icons.search), //todo: add icon from icons8
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      print("todo: open search");
                      print("$_screenWidth");
                    },
                  )
                ],
                leading: IconButton(
                  iconSize: 24.0,
                  icon: Icon(Icons.menu), //todo: add icon from icons8
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                bottom: PreferredSize(
                  preferredSize: Size(_screenWidth, 150),
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        indicatorColor: Theme.of(context).primaryColor,
                        controller: topController,
                        labelColor: Theme.of(context).dividerColor,
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
                        indicatorColor: Theme.of(context).primaryColor,
                        labelColor: Theme.of(context).dividerColor,
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
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TitleCard(
                      width: _containerWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: OrderColumn(
                        width: _containerWidth,
                        title: "For you",
                        subtitle: "Trades based on what you've saved.",
                        orders: <Order>[],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: IndustryRow(
                        width: _screenWidth,
                        height: _screenWidth * 11 / 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: OrderColumn(
                        width: _containerWidth,
                        title: "Largest trades",
                        subtitle: "Trades ordered on volume.",
                        orders: <Order>[],
                      ),
                    ),
                    EndlessOrderColumn()
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
