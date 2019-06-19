import 'package:flutter/material.dart';

import '../../logic/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/styled_text_field.dart';

/*
StyledMaterial returns a styled Container with a color of themeData.canvas, 
a height & width of the height and width provided, and a elevation of 7.0.
It also includes padding of the amount specified, and takes a child.
*/
class StyledContainer extends StatefulWidget {
  Widget child;
  double width;
  double height;
  double verticalInternalPadding;
  double horizontalInternalPadding;
  bool hasBorder;

  StyledContainer({
    this.child,
    this.width,
    this.height,
    this.verticalInternalPadding,
    this.horizontalInternalPadding,
    this.hasBorder,
  });

  @override
  _StyledContainerState createState() => _StyledContainerState(
        child: child,
        width: width,
        height: height,
        verticalInternalPadding: verticalInternalPadding,
        horizontalInternalPadding: horizontalInternalPadding,
        hasBorder: hasBorder
      );
}

class _StyledContainerState extends State<StyledContainer> {
  Widget child;
  double width;
  double height;
  double verticalInternalPadding;
  double horizontalInternalPadding;
  bool hasBorder;

  _StyledContainerState({Widget child, double width, double height, double verticalInternalPadding, double horizontalInternalPadding, bool hasBorder}) {
    this.child = child;
    this.width = width;
    this.height = height;
    (this.verticalInternalPadding != null) ? this.verticalInternalPadding = verticalInternalPadding : this.verticalInternalPadding = 0;
    (this.horizontalInternalPadding != null) ? this.horizontalInternalPadding = horizontalInternalPadding : this.horizontalInternalPadding = 0;
    this.hasBorder = hasBorder;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;

    return Material(
      borderRadius: BorderRadius.all(const Radius.circular(8.0)),
      elevation: 5.0,
      child: Container(
          decoration: BoxDecoration(
              color: themeData.canvasColor,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              border: (hasBorder == true) ? Border.all(color: Color(0xFFBEC0C0), width: 1.25, style: BorderStyle.solid) : null
              ),
          width: width,
          height: height,
          child: Padding(
            padding: EdgeInsets.only(
                top: horizontalInternalPadding,
                bottom: horizontalInternalPadding,
                left: verticalInternalPadding,
                right: verticalInternalPadding),
            child: child,
          )),
    );
  }
}
