import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/themebloc.dart';

class InfoCard extends StatefulWidget {
  final String company;
  final String companyName;
  final String type;
  final String size;
  final String time;
  final double internalPadding;
  final double width;
  final double height;

  InfoCard({
    this.company,
    this.companyName,
    this.type,
    this.size,
    this.time,
    this.internalPadding,
    this.width,
    this.height,
  });

  @override
  _InfoCardState createState() => _InfoCardState(
        company: company,
        companyName: companyName,
        size: size,
        time: time,
        internalPadding: internalPadding,
        width: width,
        height: height,
        type: type,
      );
}

class _InfoCardState extends State<InfoCard> {
  final String company;
  final String companyName;
  final String size;
  final String type;
  final String time;
  final double internalPadding;
  final double width;
  final double height;

  _InfoCardState({
    this.company,
    this.companyName,
    this.type,
    this.size,
    this.time,
    this.internalPadding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;

    return Material(
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.all(const Radius.circular(8.0)),
      elevation: 7.0,
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color(0xFFBEC0C0),
                  width: 1.25,
                  style: BorderStyle.solid),
              color: themeData.canvasColor,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          width: width,
          height: 65,
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
                        child: Text("$company",
                            style: themeData.textTheme.display1),
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
                        child: Text("$size " + "",
                            style: TextStyle(
                                color: themeData.primaryColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400)),
                      ),
                      Text(
                        "$time",
                        style: themeData.textTheme.caption,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
