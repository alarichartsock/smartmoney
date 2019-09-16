import 'package:flutter/material.dart';

/*
 * Returns a Raised Button with the specifications that we want for Smartmoney.
 * onPressed, width, and height are required.
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
      onPressed: onPressed, width: width, height: height, text: text);
}

class _StyledButtonState extends State<StyledButton> {
  final VoidCallback onPressed;
  final double width;
  final double height;
  final String text;

  _StyledButtonState({
    @required this.onPressed,
    @required this.width,
    @required this.height,
    this.text,
  });

  @override
  Widget build(BuildContext context) {

    return RaisedButton(
      elevation: 8.0,
      focusElevation: 2.0,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
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
