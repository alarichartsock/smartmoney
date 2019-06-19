import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/themebloc.dart';

/*
The IndustryCard class contains paramrters relating to size and color.
Displays a particular industry and on tap it should open a industryScreen.
Todo: build material routing for industry screen.
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
    ThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;

    return Padding(
      padding: EdgeInsets.only(left: externalLeftPadding),
      child: Material(
          shadowColor: Colors.black26,
          borderRadius: BorderRadius.all(const Radius.circular(8.0)),
          elevation: 7.0,
          child: GestureDetector(
            onTap: () {
              print("todo: use hero to open industryscreen or sum");
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xFFBEC0C0),
                      width: 1.25,
                      style: BorderStyle.solid),
                  color: themeData.canvasColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              height: size,
              width: size,
              child: Padding(
                padding: EdgeInsets.all(internalPadding),
                child: Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        print("todo: use hero to open industryscreen or sum");
                      },
                      icon: icon,
                      iconSize: iconSize,
                      color: (isGreen == true)
                          ? themeData.primaryColor
                          : themeData.accentColor,
                    ),
                    Text(
                      "$industryName",
                      style: TextStyle(
                        color: themeData.primaryColorDark,
                        fontSize: 19.0,
                        fontWeight: FontWeight.w400,

                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
