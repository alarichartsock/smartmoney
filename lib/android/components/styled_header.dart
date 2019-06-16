import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/themebloc.dart';
import '../components/styled_container.dart';

/*
* Returns a styled header with a tile and subtitle.
* Refactor to stateful widget if isn't responding to theme changes.
*/
class StyledHeader extends StatelessWidget {
  String _title;
  String _subtitle;
  double _width;
  double _padding;

  StyledHeader(String title, String subtitle, double width, double padding) {
    this._title = title;
    this._subtitle = subtitle;
    this._width = width;
    this._padding = padding;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData =
        BlocProvider.of<ThemeBloc>(context).currentState; //Fetching Theme data.

    return StyledContainer(
        width: _width,
        height: 9 /
            41 *
            _width, //todo: modify value to a less grizzly number to scale dimensions better
        verticalPadding: _padding,
        horizontalPadding: _padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$_title",
              style: themeData.textTheme.display1,
            ),
            Padding(
              padding: EdgeInsets.only(top: _padding / 2),
              child: Text("$_subtitle", style: themeData.textTheme.subtitle),
            ),
          ],
        ));
  }
}
