import 'package:flutter/material.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';

import '.././logic/theme/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StyledTextField extends StatefulWidget {
  final String helperText;
  final String labelText;
  final int maxLines;

  StyledTextField({
    this.helperText,
    this.labelText,
    this.maxLines,
  });

  @override
  _StyledTextFieldState createState() =>
      _StyledTextFieldState(helperText, labelText, maxLines);
}

class _StyledTextFieldState extends State<StyledTextField> {
  final String helperText;
  final String labelText;
  final int maxLines;

  _StyledTextFieldState(
    this.helperText,
    this.labelText,
    this.maxLines,
  );

  RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)));
  OutlineInputBorder greyBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: const BorderSide(
        width: 1.0,
        color: const Color(0xFFBEC0C0), //#bec0c0
      ));
  OutlineInputBorder greenBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: const BorderSide(
        width: 1.0,
        color: const Color(0xFF00E690), //#00e690
      ));
  OutlineInputBorder redBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: const BorderSide(
        width: 1.0,
        color: const Color(0xFFBEC0C0), //#f45531
      ));

  //todo: change collor to green on submitted or
  @override
  Widget build(BuildContext context) {
    CustomThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;

    String charCount = 0.toString();

    return TextField(
      decoration: InputDecoration(
        fillColor: themeData.canvasColor,
        enabled: true,
        labelStyle: themeData.textTheme.subtitle1,
        helperStyle: themeData.textTheme.subtitle1,
        labelText: "$labelText",
        //helperText: (helperText != null) ? helperText : "",
        focusedErrorBorder: redBorder,
        errorBorder: redBorder,
        enabledBorder: greyBorder,
        focusedBorder: greyBorder,
      ),
    );
  }
}
