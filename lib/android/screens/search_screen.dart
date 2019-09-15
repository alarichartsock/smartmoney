import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));

    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);

    TabController searchController = TabController(length: 2, vsync: this);

    return Container(
      color: Theme.of(context).backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
                  centerTitle: true,
                  shape: appBarBorder,
                  backgroundColor: Theme.of(context).canvasColor,
                  title: TextField(),
                  actions: <Widget>[
                    IconButton(
                      iconSize: 24.0,
                      icon: Icon(Icons.search), //todo: add icon from icons8
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        print("todo: find out what to do with this.");
                      },
                    )
                  ],
                  leading: IconButton(
                    iconSize: 24.0,
                    icon: Icon(Icons.arrow_back), //todo: add icon from icons8
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
            ),
            resizeToAvoidBottomInset: false,
            extendBody: false,
            backgroundColor: Colors.transparent,
            body: Container()),
      ),
    );
  }
}
