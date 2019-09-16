import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TitleCard extends StatefulWidget {
  final String title;
  final String description;

  TitleCard({
    this.title,
    this.description
  });

  @override
  _TitleCardState createState() => _TitleCardState(title: title, description: description);
}

class _TitleCardState extends State<TitleCard> {

  String title;
  String description;

  _TitleCardState({
    this.title,
    this.description
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
          builder: (context, orientation) {
          return Material(
          borderRadius: BorderRadius.all(const Radius.circular(8.0)),
          elevation: 5.0,
          child: Container(
            width: MediaQuery.of(context).size.width - 32,
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
          ));}
    );
  }
}
