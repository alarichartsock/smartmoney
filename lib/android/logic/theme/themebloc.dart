import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'dart:async';

import './darkTheme.dart';
import './lightTheme.dart';

enum ThemeEvent { lightEvent, darkEvent, switchEvent }

// abstract class ThemeEvent {}

// class LightEvent extends ThemeEvent {
// } // Event signifying a theme change to light.

// class DarkEvent extends ThemeEvent {
// } // Event signifying a theme change to dark.

// class SwitchEvent extends ThemeEvent {
// } // Event signifying a change to the opposite of whatever theme there currently is.

/*
Our ThemeBloc takes in incoming ThemeEvents and returns a stream of ThemeData 
(in this case, our predefined darkTheme and lightTheme in ../theme/darkTheme and ../theme/lightTheme respectively.).
*/

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {

  @override
  ThemeData get initialState => lightTheme;

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
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
  void onTransition(Transition<ThemeEvent, ThemeData> transition) {
    print("Changing theme to" + '$currentState');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
  }
}
