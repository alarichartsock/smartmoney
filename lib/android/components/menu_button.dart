import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';
import '.././logic/theme/themebloc.dart';

class MenuButton extends StatefulWidget {
  double size;
  Icon icon;
  String title;
  VoidCallback onPressed;
  bool selected;

  MenuButton({
    this.size,
    this.icon,
    this.title,
    this.onPressed,
    this.selected,
  });

  @override
  _MenuButtonState createState() => _MenuButtonState(
      size: size,
      icon: icon,
      title: title,
      onPressed: onPressed,
      selected: selected);
}

class _MenuButtonState extends State<MenuButton> {
  double size;
  Icon icon;
  String title;
  VoidCallback onPressed;
  bool selected;

  GlobalKey<ScaffoldState> _textKey = new GlobalKey();

  _MenuButtonState({
    this.size,
    this.icon,
    this.title,
    this.onPressed,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {

    CustomThemeData customThemeData = BlocProvider.of<ThemeBloc>(context).currentState;

    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: size,
        width: size,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: IconButton(
                iconSize: 40.0,
                icon: icon,
                color: (selected == true)
                    ? customThemeData.primaryColor
                    : customThemeData.secondaryContrast,
                onPressed: () {
                  onPressed();
                },
              ),
            ),
            Text(
              "$title",
              key: _textKey,
              style: TextStyle(
                fontSize: 18.0,
                color: (selected == true) ? customThemeData.firstContrast : customThemeData.secondaryContrast,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              color: (selected == true) ? customThemeData.primaryColor : Colors.transparent,
              width: 50,
              height: 2,
            )
          ],
        ),
      ),
    );
  }
}
