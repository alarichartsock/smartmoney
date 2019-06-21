import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '.././logic/theme/themebloc.dart';

/*
 * Returns a Raised Button with the specifications that we want for Smartmoney.
 * We are using some artistic license with our buttons in that typical Material Design protocol says that when a button is being pressed,
 * it should increase elevation. I've reversed this, so that when the button is pressed its elevation goes down, much like a real button would.
 * In my (Alaric's) opinion, this makes more sense and looks better.
 */
class StyledButton extends StatefulWidget {

  final VoidCallback onPressed;
  final double width;
  final double height;
  final String text;

  StyledButton({
    @required this.onPressed,
    @required this.width,
    @required this.height,
    this.text,
  });

  @override
  _StyledButtonState createState() => _StyledButtonState(
    onPressed: onPressed,
    width: width,
    height: height,
    text: text
  );
}

class _StyledButtonState extends State<StyledButton> {

  final VoidCallback onPressed;
  final double width;
  final double height;
  final String text;

  _StyledButtonState({
    this.onPressed,
    this.width,
    this.height,
    this.text,
  });

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState; //Fetching Theme data.

    return RaisedButton(
      elevation: 8.0,
      focusElevation: 2.0,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        onPressed: onPressed,
        color: themeData.primaryColor,
        child: Container(
          width: width,
          height: height,
          child: Center(
            child: Text("$text",
              style: TextStyle(
                color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16))),
        ),
    );
  }
}
