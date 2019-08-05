import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmoney/android/components/styled_container.dart';

class TitleCard extends StatefulWidget {
  final double width;
  final String title;
  final String description;

  TitleCard({
    this.width,
    this.title,
    this.description
  });

  @override
  _TitleCardState createState() => _TitleCardState(width: width, title: title, description: description);
}

class _TitleCardState extends State<TitleCard> {
  double width;
  String title;
  String description;

  _TitleCardState({
    this.width,
    this.title,
    this.description
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.all(const Radius.circular(8.0)),
        elevation: 5.0,
        child: Container(
          width: width,
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$title",
                  style: Theme.of(context).textTheme.display3,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "$description",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
