import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/industry_row.dart';

import '../././logic/theme/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '.././components/menu_button.dart';
import '../logic/data/order.dart';

class InfoScreen extends StatefulWidget {
  final Order order;

  InfoScreen({this.order});

  @override
  _InfoScreenState createState() => _InfoScreenState(
        order: order,
      );
}

class _InfoScreenState extends State<InfoScreen> {
  final Order order;

  _InfoScreenState({this.order});

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);
    double _containerHeight = _screenHeight - 56.0 - (_margin * 4);
    const double _padding = 8.0;

    ThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;

    return Scaffold(
      
    );
  }
}
