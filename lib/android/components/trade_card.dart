import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/themebloc.dart';
import '../components/styled_container.dart';



class TradeCard extends StatefulWidget {
  final String company;
  final String companyName;
  final String orderType;
  final String orderSize;
  final String orderTime;
  final double internalPadding;
  final double width;
  final double height;

  TradeCard({
    this.company,
    this.companyName,
    this.orderType,
    this.orderSize,
    this.orderTime,
    this.internalPadding,
    this.width,
    this.height,
  });

  @override
  _TradeCardState createState() => _TradeCardState(
        company: company,
        companyName: companyName,
        orderSize: orderSize,
        orderTime: orderTime,
        internalPadding: internalPadding,
        width: width,
        height: height,
        orderType: orderType,
      );
}

class _TradeCardState extends State<TradeCard> {
  final String company;
  final String companyName;
  final String orderSize;
  final String orderType;
  final String orderTime;
  final double internalPadding;
  final double width;
  final double height;

  _TradeCardState({
    this.company,
    this.companyName,
    this.orderType,
    this.orderSize,
    this.orderTime,
    this.internalPadding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;

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
                    child: Text("$company", style: themeData.textTheme.display1),
                  ),
                  Text("$companyName",
                      style: TextStyle(
                          color: themeData.primaryColorDark,
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
                    child: Text("$orderSize " + "",
                        style: TextStyle(
                            color: themeData.primaryColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400)),
                  ),
                  Text(
                    "$orderTime",
                    style: themeData.textTheme.caption,
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
