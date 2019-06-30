import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';
import 'dart:async';

import './darkTheme.dart';
import './lightTheme.dart';

enum ThemeEvent { lightEvent, darkEvent, switchEvent }

class ThemeBloc extends Bloc<ThemeEvent, CustomThemeData> {

  @override
  CustomThemeData get initialState => lightTheme;

  @override
  Stream<CustomThemeData> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.lightEvent:
        yield lightTheme;
        print("lighEvent called");
        break;
      case ThemeEvent.darkEvent:
        print("darkEvent called");
        yield darkTheme;
        break;
      case ThemeEvent.switchEvent:
        if (currentState == darkTheme) {
          yield lightTheme;
          print("lighEvent called");
          break;
        } else if (currentState == lightTheme) {
          yield darkTheme;
          print("darkEvent called");
          break;
        }
    }
  }

  /*
  Todo: send onTransition and onError details to a server so we can understand which theme our users perfer, 
  and when we get an error within the app theming.
  */

  @override
  void onTransition(Transition<ThemeEvent, CustomThemeData> transition) {
    print("Changing theme to" + '$currentState');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
  }
}
