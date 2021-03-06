import 'package:flutter/material.dart';
import 'dart:math' as math;

class StockInfoColumn extends StatefulWidget {
  final double screenWidth;

  StockInfoColumn({this.screenWidth});

  @override
  _StockInfoColumnState createState() => _StockInfoColumnState(screenWidth: screenWidth);
}

class _StockInfoColumnState extends State<StockInfoColumn>
    with SingleTickerProviderStateMixin {
  _StockInfoColumnState({this.screenWidth});

  double screenWidth;

  Key key;

  String ticker;

  Animation<double> _rotateAnimation;
  AnimationController _rotateController;

  bool isOpen = false;
  bool onWatchList = false;

  double heightClosed = 200;
  double heightOpened = 290;
  double currentHeight = 200;

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
                  width: (screenWidth - 64) / 2,
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
                    width: (screenWidth - 64) / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "P/E RATIO: ",
                            style: dataStyle,
                          ),
                        ),
                        Text(
                          "5.04",
                          style: Theme.of(context).textTheme.display4,
                        ),
                      ],
                    ),
                  ),
                
              ],
            ),
          ),
          Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: screenWidth / 2 - 36,
                          height: 3.0,
                          color: Theme.of(context).hintColor,
                      ),
                        ),
                    ),
                    Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                          width: screenWidth / 2 - 36,
                          height: 3.0,
                          color:Theme.of(context).hintColor
                      ),
                        ),
                    ),
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
                  width: (screenWidth - 64) / 2,
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
                  width: (screenWidth - 64) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "DIV/YIELD: ",
                          style: dataStyle,
                        ),
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
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: screenWidth / 2 - 36,
                          height: 3.0,
                          color: Theme.of(context).hintColor,
                      ),
                        ),
                    ),
                    Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                          width: screenWidth / 2 - 36,
                          height: 3.0,
                          color:Theme.of(context).hintColor
                      ),
                        ),
                    ),
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
                  width: (screenWidth - 64) / 2,
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
                  width: (screenWidth - 64) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Volume: ",
                          style: dataStyle,
                        ),
                      ),
                      Text(
                        "10000",
                        style: Theme.of(context).textTheme.display4,
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
            
          ),
                    Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: screenWidth / 2 - 36,
                          height: 3.0,
                          color: Theme.of(context).hintColor,
                      ),
                        ),
                    ),
                    Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                          width: screenWidth / 2 - 36,
                          height: 3.0,
                          color:Theme.of(context).hintColor
                      ),
                        ),
                    ),
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
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      //color: Colors.red,
                      width: (screenWidth - 64) / 2,
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
                      width: (screenWidth - 64) / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "VOLUME: ",
                              style: dataStyle,
                            ),
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
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                          height: 2.5,
                          color: Theme.of(context).hintColor,
                      ),
                        ),
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                          height: 2.5,
                          color:Theme.of(context).hintColor
                      ),
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      //color: Colors.red,
                      width: (screenWidth - 64) / 2,
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
                      width: (screenWidth - 64) / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "AVG VOL: ",
                              style: dataStyle,
                            ),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                          height: 2.5,
                          color: Theme.of(context).hintColor,
                      ),
                        ),
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                          height: 2.5,
                          color:Theme.of(context).hintColor
                      ),
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      //color: Colors.red,
                      width: (screenWidth - 64) / 2,
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
                      width: (screenWidth - 64) / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "MKT CAP: ",
                              style: dataStyle,
                            ),
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
              ),
                            Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                          height: 3.0,
                          color: Theme.of(context).hintColor,
                      ),
                        ),
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                          height: 3.0,
                          color:Theme.of(context).hintColor
                      ),
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          Positioned(
            top: 120.0, //
            left: -5.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: addItems()),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Center(
                child: Container(
                  width: screenWidth - 16.0,
                  height: 40.0,
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
