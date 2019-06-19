import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmoney/android/components/trade_card.dart';
import '../../logic/themebloc.dart';

/*
Shows TradeCard's vertically, giving an option to 'see more'.
Initially shows 3 TradeCards. After "SEE MORE" is pressed, the widget expands and shows 3 more cards.
*/

class TradeColumn extends StatefulWidget {
  //todo: stop the collapse from immediately erasing the contents.
  double width;
  String title;
  String subtitle;

  TradeColumn({ this.width, this.title, this.subtitle});

  @override
  _TradeColumnState createState() =>
      _TradeColumnState(width, title, subtitle);
}

class _TradeColumnState extends State<TradeColumn>
    with TickerProviderStateMixin {
  double width;
  double height;
  double expandedHeight;

  _TradeColumnState(
      double width, String title, String subtitle) {
    this.width = width;
    this.height = width * 19 / 20;
    this.title = title;
    this.subtitle = subtitle;
  }

  String title;
  String subtitle;

  Animation<double> _rotateAnimation;
  AnimationController _rotateController;

  bool isOpen = false;

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
  void dispose() {
    _rotateController.dispose();
    super.dispose();
  }

  void handleTap() {
    setState(() {
      switch (_rotateController.status) {
        //switch case needed so that the user can't break the animation by tapping on it very fast.
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
        height = height * 16 / 10;
      } else {
        isOpen = false;
        height = width * 19 / 20;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> hi = [
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: TradeCard(
            company: "Apple",
            companyName: "Apple Incorporated",
            orderType: "Put",
            orderSize: "5.2M",
            orderTime: "6/13/2019 8:31PM",
            internalPadding: 18,
            width: width - 32,
          ),
        ),
      ),
    ];

    Widget addItems() {
      if (isOpen == true) {
        return hi[0];
      } else {
        return Container();
      }
    }

    ThemeData themeData =
        BlocProvider.of<ThemeBloc>(context).currentState; //Fetching Theme data.

    return Card(
      margin: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(const Radius.circular(8.0))),
      elevation: 5.0,
      child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
              color: themeData.canvasColor,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          width: width,
          height: height,
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16.0),
                    child: Text(
                      "$title",
                      style: themeData.textTheme.display2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, left: 16.0),
                    child: Text(
                      "$subtitle",
                      style: themeData.textTheme.subtitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: hi[0],
                  ),
                  hi[0],
                  hi[0],
                ],
              ),
              Positioned(
                top: 292.0,
                left: 14.0,
                child: Column(
                  children: <Widget>[
                    addItems(),
                    addItems(),
                    addItems(),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: width - 16.0,
                      height: 50.0,
                      color: themeData.canvasColor,
                      child: GestureDetector(
                        onTap: () {
                          print("should be opening");
                          handleTap();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "SEE MORE",
                              style: themeData.textTheme.button,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom:
                                      8.0), //todo: align iconbutton in a different way
                              child: AnimatedBuilder(
                                  // rotates the top icon
                                  animation: _rotateAnimation,
                                  builder: (context, child) {
                                    return Transform.rotate( //todo: make the iconbutton look less fucking silly lol
                                      angle: _rotateController.value * math.pi,
                                      child: IconButton(
                                        icon: Icon(Icons.arrow_drop_down),
                                        color: themeData.primaryColor,
                                        iconSize: 40,
                                        onPressed: () {
                                          print("should be opening");
                                          handleTap();
                                        },
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
