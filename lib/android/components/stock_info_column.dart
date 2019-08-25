import 'package:flutter/material.dart';
import 'dart:math' as math;

class StockInfoColumn extends StatefulWidget {
  double width;

  StockInfoColumn({this.width});

  @override
  _StockInfoColumnState createState() => _StockInfoColumnState(width: width);
}

class _StockInfoColumnState extends State<StockInfoColumn>
    with SingleTickerProviderStateMixin {
  _StockInfoColumnState({this.width});

  double width;

  Key key;

  String ticker;

  Animation<double> _rotateAnimation;
  AnimationController _rotateController;

  bool isOpen = false;
  bool onWatchList = false;

  double heightClosed = 170;
  double heightOpened = 270;
  double currentHeight = 170;

  Icon watchlistIcon = Icon(Icons.remove_red_eye);

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
    TextStyle dataStyle = TextStyle(
        color: Theme.of(context).focusColor,
        fontWeight: FontWeight.w400,
        fontSize: 16.0);

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
          currentHeight = heightOpened;
        } else {
          isOpen = false;
          currentHeight = heightClosed;
        }
      });
    }

    List<Widget> addItems() {
      if (isOpen == true) {
        return [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  //color: Colors.red,
                  width: (width - 64) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "52 WK HIGH: ",
                        style: dataStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "54.68",
                          style: Theme.of(context).textTheme.display4,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  //color: Colors.green,
                  width: (width - 64) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "P/E RATIO: ",
                        style: dataStyle,
                      ),
                      Text(
                        "5.04",
                        style: Theme.of(context).textTheme.display4,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  //color: Colors.red,
                  width: (width - 64) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "52 WK LOW: ",
                        style: dataStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "28.35",
                          style: Theme.of(context).textTheme.display4,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  //color: Colors.green,
                  width: (width - 64) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "DIV/YIELD: ",
                        style: dataStyle,
                      ),
                      Text(
                        "0.0",
                        style: Theme.of(context).textTheme.display4,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  //color: Colors.red,
                  width: (width - 64) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Price: ",
                        style: dataStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "186.5",
                          style: Theme.of(context).textTheme.display4,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  //color: Colors.green,
                  width: (width - 64) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Volume: ",
                        style: dataStyle,
                      ),
                      Text(
                        "10000",
                        style: Theme.of(context).textTheme.display4,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ];
      } else {
        return [];
      }
    }

    return AnimatedContainer(
      key: key,
      height: currentHeight,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.all(const Radius.circular(80))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Stats",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      //color: Colors.red,
                      width: (width - 64) / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "OPEN: ",
                            style: dataStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              "11:51:30",
                              style: Theme.of(context).textTheme.display4,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      width: (width - 64) / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "VOLUME: ",
                            style: dataStyle,
                          ),
                          Text(
                            "8/19/2019",
                            style: Theme.of(context).textTheme.display4,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      //color: Colors.red,
                      width: (width - 64) / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "HIGH: ",
                            style: dataStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              "186.5",
                              style: Theme.of(context).textTheme.display4,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      width: (width - 64) / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "AVG VOL: ",
                            style: dataStyle,
                          ),
                          Text(
                            "10000",
                            style: Theme.of(context).textTheme.display4,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    //color: Colors.red,
                    width: (width - 64) / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "LOW: ",
                          style: dataStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            "1600000\$",
                            style: Theme.of(context).textTheme.display4,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.green,
                    width: (width - 64) / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "MKT CAP: ",
                          style: dataStyle,
                        ),
                        Text(
                          "5.2M\$",
                          style: Theme.of(context).textTheme.display4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 110.0, //
            // left: 14.0,
            child: Column(children: addItems()),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Center(
                child: Container(
                  width: width - 16.0,
                  height: 30.0,
                  child: GestureDetector(
                    onTap: () {
                      handleTap();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "SEE MORE",
                          style: Theme.of(context).textTheme.button,
                        ),
                        AnimatedBuilder(
                            // rotates the top icon
                            animation: _rotateAnimation,
                            builder: (context, child) {
                              return Transform.rotate(
                                //todo: make the iconbutton look less fucking silly lol
                                angle: _rotateController.value * math.pi,
                                child: IconButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  color: Theme.of(context).primaryColor,
                                  iconSize: 40,
                                  onPressed: () {
                                    handleTap();
                                  },
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
