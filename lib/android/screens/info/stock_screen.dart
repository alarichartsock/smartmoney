import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/stock_info_column.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class StockScreen extends StatefulWidget {
  StockScreen({this.ticker});

  String ticker;

  @override
  _StockScreenState createState() => _StockScreenState(ticker: ticker);
}

class _StockScreenState extends State<StockScreen>
    with SingleTickerProviderStateMixin {

  _StockScreenState({this.ticker});

  String ticker;

  Animation<double> _rotateAnimation;
  AnimationController _rotateController;
  bool isOpen = false;
  bool onWatchList;

  double heightClosed = 250;
  double heightOpened = 300;
  double currentHeight;

  Icon watchlistIcon = Icon(Icons.remove_red_eye);

  static String fulldescription = "Apple, Inc. engages in the design, manufacture, and marketing of mobile communication, media devices, personal computers, and portable digital music players. It operates through the following geographical segments: Americas, Europe, Greater China, Japan, and Rest of Asia Pacific. The Americas segment includes North and South America. The Europe segment consists of European countries, as well as India, the Middle East, and Africa. The Greater China segment comprises of China, Hong Kong, and Taiwan. The Rest of Asia Pacific segment includes Australia and Asian countries. The company was founded by Steven Paul Jobs, Ronald Gerald Wayne, and Stephen G. Wozniak on April 1, 1976 and is headquartered in Cupertino, CA.";
  static String trimmedDescription = fulldescription.replaceRange(5, null, "");
  static String currentDescription = trimmedDescription;

  Future<String> getKey() async {
    RemoteConfig remoteConfig = await RemoteConfig.instance;
    await remoteConfig.fetch(expiration: Duration(hours: 1));
    await remoteConfig.activateFetched();

    String key = remoteConfig.getValue('key').asString();
    print("$key");
    return key;
  }

  @override
  void initState() {
    super.initState();
    _rotateController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: _rotateController, curve: Curves.decelerate),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);
    double _containerHeight = _screenHeight - 56.0 - (_margin * 4);
    const double _padding = 8.0;

    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));

    void handleTap() {
      setState(() {
        switch (_rotateController.status) {
          case AnimationStatus.forward:
            _rotateController.reverse();
            break;
          case AnimationStatus.reverse:
            _rotateController.forward();
            break;
          case AnimationStatus.dismissed:
            _rotateController.forward();
            break;
          case AnimationStatus.completed:
            _rotateController.reverse();
            break;
        }
        if (isOpen == false) {
          isOpen = true;
          setState(() {
            currentHeight = heightOpened;
          });
        } else {
          isOpen = false;
          setState(() {
            currentHeight = heightClosed;
          });
          currentHeight = heightClosed;
        }
      });
    }

    return Container(
      color: Theme.of(context).backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 56.0),
            child: AppBar(
              centerTitle: true,
              title: Text(
                "AAPL",
                style: Theme.of(context).textTheme.title,
              ),
              backgroundColor: Theme.of(context).canvasColor,
              shape: appBarBorder,
              leading: IconButton(
                  iconSize: 24.0,
                  icon: Icon(Icons.arrow_back),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    print(Navigator.of(context).toString());
                    Navigator.of(context).pop();
                  }),
              actions: <Widget>[
                IconButton(
                  icon: watchlistIcon,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    setState(() {
                      getKey();
                    });
                    if (onWatchList == false) {
                      setState(() {
                        onWatchList = true;
                        watchlistIcon = Icon(Icons.remove_shopping_cart);
                      });
                    } else {
                      setState(() {
                        onWatchList = false;
                        watchlistIcon = Icon(Icons.remove_red_eye);
                      });
                    }
                  },
                )
              ],
            ),
          ),
          body: ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: Theme.of(context).primaryColor,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Material(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(8.0)),
                      elevation: 5.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(8.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Apple Incorporated",
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "\$42.81",
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                              //todo: add graph
                              Container(
                                color: Colors.red,
                                width: _containerWidth,
                                height: _containerWidth / 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Material(
                        elevation: 5.0,
                        borderRadius:
                            BorderRadius.all(const Radius.circular(8.0)),
                        child: StockInfoColumn(
                          width: _screenWidth,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Material(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(8.0)),
                      elevation: 5.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(8.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Earnings",
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                              //todo: add graph
                              Container(
                                color: Colors.red,
                                width: _containerWidth,
                                height: _containerWidth / 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                    child: Material(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(8.0)),
                      elevation: 5.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(8.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "About Apple Incorporated",
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "$currentDescription",
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                            ],
                          ),
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
