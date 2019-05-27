import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './logic/themebloc.dart';
import './onboarding/onboarding.dart';

void main() => runApp(Smartmoney()); 

class Smartmoney extends StatelessWidget {

  final ThemeBloc _themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _themeBloc,
      child: BlocBuilder(
        bloc: _themeBloc,
        builder: (BuildContext context,ThemeData theme) {
          return MaterialApp( 
          title: "Smartmoney",
          home: Onboarding()
          );
        },
      )
    );
  }
}

