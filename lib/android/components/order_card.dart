import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';
import '.././logic/theme/themebloc.dart';
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
    CustomThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;

    return StyledContainer(
      height: height,
      width: width,
      verticalInternalPadding: internalPadding,
      horizontalInternalPadding: internalPadding,
      hasBorder: true,
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
                    child:
                        Text(order.getTicker(), style: themeData.textTheme.h6),
                  ),
                  Text(order.getCompany(),
                      style: TextStyle(
                          color: themeData.secondaryContrast,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400)
                          ),
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
                            color: themeData.primaryColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400)),
                  ),
                  Text(
                    order.getTime(),
                    style: themeData.textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
