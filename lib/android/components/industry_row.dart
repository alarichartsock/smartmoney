import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmoney/android/components/styled_container.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';
import '.././logic/theme/themebloc.dart';
import './industry_card.dart';

class IndustryRow extends StatefulWidget {
  List cardList = <IndustryCard>[];
  double height;
  double width;

  IndustryRow({this.cardList, this.height, this.width});

  @override
  _IndustryRowState createState() =>
      _IndustryRowState(cardList: cardList, height: height, width: width);
}

class _IndustryRowState extends State<IndustryRow> {
  List cardList = <IndustryCard>[];
  double height;
  double width;

  _IndustryRowState({
    this.cardList,
    this.height,
    this.width,
  });

  IndustryCard card1 = IndustryCard(
    size: 120,
    icon: Icon(Icons.arrow_back),
    iconSize: 35.0,
    industryName: "Robotics",
    isGreen: true,
    internalPadding: 18.0,
    externalLeftPadding: 32.0,
  );
  IndustryCard card2 = IndustryCard(
    size: 120,
    icon: Icon(Icons.arrow_back),
    iconSize: 35.0,
    industryName: "Robotics",
    isGreen: true,
    internalPadding: 18.0,
    externalLeftPadding: 8.0,
  );
  IndustryCard card3 = IndustryCard(
    size: 120,
    icon: Icon(Icons.arrow_back),
    iconSize: 35.0,
    industryName: "Robotics",
    isGreen: true,
    internalPadding: 18.0,
    externalLeftPadding: 8.0,
  );
  IndustryCard card4 = IndustryCard(
    size: 120,
    icon: Icon(Icons.arrow_back),
    iconSize: 35.0,
    industryName: "Robotics",
    isGreen: true,
    internalPadding: 18.0,
    externalLeftPadding: 8.0,
  );

  @override
  Widget build(BuildContext context) {
    CustomThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;

    return Container(
      color: Colors.transparent,
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0),
            child: StyledContainer(
              width: width - 32,
              height: height,
              hasBorder: false,
              verticalInternalPadding: 16.0,
              horizontalInternalPadding: 16.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                        child: Text(
                          "By sector",
                          style: themeData.textTheme.h5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("todo: route to industry screen");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 16.0),
                              child: Text(
                                "SEE ALL",
                                style: themeData.textTheme.button,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_right),
                              onPressed: () {
                                print("todo: route to total list");
                              },
                              color: themeData.primaryColor,
                              iconSize: 16.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Trades on specific stocks and indexes.",
                      style: themeData.textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            top: 90.0,
            child: Container(
              width: width + 25,
              height: 114,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  card1,
                  card2,
                  card3,
                  Padding(
                    padding: EdgeInsets.only(right: 18.0),
                    child: card4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
