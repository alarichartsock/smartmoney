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
  final double width;
  final double height;
  final double verticalPadding;
  final double horizontalPadding;

  StyledContainer({
    this.child,
    this.width,
    this.height,
    this.verticalPadding,
    this.horizontalPadding,
  });

  @override
  _StyledContainerState createState() => _StyledContainerState(
        child: child,
        width: width,
        height: height,
        verticalPadding: verticalPadding,
        horizontalPadding: horizontalPadding,
      );
}

class _StyledContainerState extends State<StyledContainer> {
  Widget child;
  final double width;
  final double height;
  final double verticalPadding;
  final double horizontalPadding;

  _StyledContainerState({
    this.child,
    this.width,
    this.height,
    this.verticalPadding,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;

    return Material(
      borderRadius: BorderRadius.all(const Radius.circular(8.0)),
      elevation: 5.0,
      child: Container(
          decoration: BoxDecoration(
              color: themeData.canvasColor,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          width: width,
          height: height,
          child: Padding(
            padding: EdgeInsets.only(
                top: horizontalPadding,
                bottom: horizontalPadding,
                left: verticalPadding,
                right: verticalPadding),
            child: child,
          )),
    );
  }
}
