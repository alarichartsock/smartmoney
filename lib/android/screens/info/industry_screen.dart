import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/styled_container.dart';

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


    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));

    return Container(
        color: Theme.of(context).backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, 56.0),
              child: AppBar(
                centerTitle: true,
                shape: appBarBorder,
                backgroundColor: Theme.of(context).canvasColor,
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Text("Robotics", style: Theme.of(context).textTheme.display2),
                      Text("122 stocks", style: Theme.of(context).textTheme.subtitle),
                    ],
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    iconSize: 24.0,
                    icon:
                        Icon(Icons.remove_red_eye), //todo: add icon from icons8
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      print("todo: open search");
                      print("$_screenWidth");
                    },
                  ),
                  IconButton(
                    iconSize: 24.0,
                    icon: Icon(Icons.search), //todo: add icon from icons8
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      print("todo: open search");
                      print("$_screenWidth");
                    },
                  ),
                ],
                leading: IconButton(
                  iconSize: 36.0,
                  icon: Icon(Icons.arrow_left), //todo: add icon from icons8
                  color: Theme.of(context).primaryColor,
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
                                        child: Text("Robotics", style: Theme.of(context).textTheme.display1,),
                                      ),
                                      Text("View robotics related stocks", style: Theme.of(context).textTheme.subtitle,),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, right: 16.0),
                                  child: IconButton(
                                    icon: Icon(Icons.settings),
                                    color: Theme.of(context).primaryColor,
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
