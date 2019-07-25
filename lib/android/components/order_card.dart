import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/styled_container.dart';
import '../logic/data/order.dart';

/*
* OrderCard takes an Order object and visualizes a couple of data points on a material design card.
*/
class OrderCard extends StatefulWidget {
  final Order order;
  final double internalPadding;
  final double width;
  final double height;

  OrderCard({
    this.order,
    this.internalPadding,
    this.width,
    this.height,
  });

  @override
  _OrderCardState createState() => _OrderCardState(
        order: order,
        internalPadding: internalPadding,
        width: width,
        height: height,
      );
}

class _OrderCardState extends State<OrderCard> {
  final double internalPadding;
  final double width;
  final double height;
  final Order order;

  _OrderCardState({
    this.order,
    this.internalPadding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(const Radius.circular(8.0)),
      elevation: 5.0,
      child: Container(
        
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(color: Color(0xFFBEC0C0), width: 1.25, style: BorderStyle.solid),
            ),
        child: Row(
          children: <Widget>[
            Container(
              width: width / 2 - 3.25,
              height: 65,
              child: Padding(
                padding: EdgeInsets.only(left: internalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.0),
                      child: Text(order.getTicker(),
                          style: Theme.of(context).textTheme.display4),
                    ),
                    Text(order.getCompany(),
                        style: TextStyle(
                            color: Theme.of(context).cursorColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ),
            Container(
              width: width / 2 - 3.25,
              height: 65,
              child: Padding(
                padding: EdgeInsets.only(right: internalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.0),
                      child: Text(order.getVolume().toString() + "",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400)),
                    ),
                    Text(
                      order.getTime(),
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
