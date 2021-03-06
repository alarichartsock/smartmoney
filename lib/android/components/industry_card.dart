import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*
* The IndustryCard class contains parameters relating to size and color.
* Displays a particular industry and on tap it should open a OrderCardColumnScreen.
* Todo: build material routing for industry screen.
* Also, change the color parameters to rely on the current price of the order that has been sent. 
* This will require fetching the actual price of the stock and running it through the black & scholls formula for options pricing. 
* Then, aggregating the data and getting the average of the specific industry.
*/
class IndustryCard extends StatefulWidget {
  final double size;
  final double internalPadding;
  final double externalLeftPadding;
  final double iconSize;
  final String industryName;
  final Icon icon;
  final bool isGreen;

  IndustryCard(
      {this.size, this.internalPadding, this.externalLeftPadding,this.industryName, this.icon, this.isGreen,this.iconSize});

  @override
  _IndustryCardState createState() => _IndustryCardState(
      size: size,
      internalPadding: internalPadding,
      externalLeftPadding: externalLeftPadding,
      industryName: industryName,
      iconSize: iconSize,
      icon: icon,
      isGreen: isGreen);
}

class _IndustryCardState extends State<IndustryCard> {
  final double size;
  final double internalPadding;
  final double externalLeftPadding;
  final double iconSize;
  final String industryName;
  final Icon icon;
  final bool isGreen;

  _IndustryCardState(
      {this.size, this.internalPadding, this.externalLeftPadding,this.industryName, this.icon, this.isGreen,this.iconSize});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left: externalLeftPadding),
      child: Material(
          shadowColor: Colors.black26,
          borderRadius: BorderRadius.all(const Radius.circular(8.0)),
          elevation: 7.0,
          child: GestureDetector(
            onTap: () {
              print("todo: use hero to open OrderCardColumnScreen or sum");
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).focusColor,
                      width: 1.25,
                      style: BorderStyle.solid),
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              height: size,
              width: size,
              child: Padding(
                padding: EdgeInsets.all(internalPadding),
                child: Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        print("todo: use hero to open OrderCardColumnScreen or sum");
                      },
                      icon: icon,
                      iconSize: iconSize,
                      color: (isGreen == true)
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).accentColor,
                    ),
                    Text(
                      "$industryName",
                      style: Theme.of(context).textTheme.subtitle
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
