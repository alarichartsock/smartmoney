import 'package:flutter/material.dart';
import 'dart:math' as math;

class OrderInfoColumn extends StatefulWidget {
  final double width;

  OrderInfoColumn({this.width});

  @override
  _OrderInfoColumnState createState() => _OrderInfoColumnState(width: width);
}

class _OrderInfoColumnState extends State<OrderInfoColumn>
    with SingleTickerProviderStateMixin {
  _OrderInfoColumnState({this.width});

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
                  children: <Widget>[
                    Text(
                      "Price: ",
                      style: Theme.of(context).textTheme.display4,
                    ),
                    Text(
                      "186.5",
                      style: Theme.of(context).textTheme.display4,
                    )
                  ],
                ),
              ),
              Container(
                //color: Colors.green,
                width: (width - 64) / 2,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Volume: ",
                      style: Theme.of(context).textTheme.display4,
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
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                //color: Colors.red,
                width: (width - 64) / 2,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Price: ",
                      style: Theme.of(context).textTheme.display4,
                    ),
                    Text(
                      "186.5",
                      style: Theme.of(context).textTheme.display4,
                    )
                  ],
                ),
              ),
              Container(
                //color: Colors.green,
                width: (width - 64) / 2,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Volume: ",
                      style: Theme.of(context).textTheme.display4,
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
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                //color: Colors.red,
                width: (width - 64) / 2,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Price: ",
                      style: Theme.of(context).textTheme.display4,
                    ),
                    Text(
                      "186.5",
                      style: Theme.of(context).textTheme.display4,
                    )
                  ],
                ),
              ),
              Container(
                //color: Colors.green,
                width: (width - 64) / 2,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Volume: ",
                      style: Theme.of(context).textTheme.display4,
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
                        children: <Widget>[
                          Text(
                            "Time: ",
                            style: Theme.of(context).textTheme.display4,
                          ),
                          Text(
                            "11:51:30",
                            style: Theme.of(context).textTheme.display4,
                          )
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      width: (width - 64) / 2,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Data: ",
                            style: Theme.of(context).textTheme.display4,
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
                        children: <Widget>[
                          Text(
                            "Price: ",
                            style: Theme.of(context).textTheme.display4,
                          ),
                          Text(
                            "186.5",
                            style: Theme.of(context).textTheme.display4,
                          )
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      width: (width - 64) / 2,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Volume: ",
                            style: Theme.of(context).textTheme.display4,
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
                      children: <Widget>[
                        Text(
                          "Total cost: ",
                          style: Theme.of(context).textTheme.display4,
                        ),
                        Text(
                          "1600000\$",
                          style: Theme.of(context).textTheme.display4,
                        )
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.green,
                    width: (width - 64) / 2,
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Venue: ",
                          style: Theme.of(context).textTheme.display4,
                        ),
                        Text(
                          "CBOE EDGX",
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
            child: Column(
              children: addItems()
            ),
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
                            Text("SEE MORE", style: Theme.of(context).textTheme.button,),
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
