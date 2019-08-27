import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './industry_card.dart';

class IndustryRow extends StatefulWidget {
  List cardList = <IndustryCard>[];
  final double height;
  final double width;
  final String description;

  IndustryRow({this.cardList, this.height, this.width, this.description});

  @override
  _IndustryRowState createState() =>
      _IndustryRowState(cardList: cardList, height: height, width: width, description: description);
}

class _IndustryRowState extends State<IndustryRow> {
  List cardList = <IndustryCard>[];
  double height;
  double width;
  String description;

  _IndustryRowState({
    this.cardList,
    this.height,
    this.width,
    this.description,
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
    return OrientationBuilder(
      builder: (context, orientation) {
        return Container(
      color: Colors.transparent,
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0),
            child: Material(
              borderRadius: BorderRadius.all(const Radius.circular(8.0)),
              elevation: 5.0,
              child: Container(
                width: width - 32,
                height: height,
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(
                      color: Color(0xFFBEC0C0),
                      width: 1.25,
                      style: BorderStyle.solid),
                ),
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
                            style: Theme.of(context).textTheme.display3,
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
                                  style: Theme.of(context).textTheme.button,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_right),
                                onPressed: () {
                                  print("todo: route to total list");
                                },
                                color: Theme.of(context).primaryColor,
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
                        "$description",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                  ],
                ),
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
      },
    );
    
    
  }
}
