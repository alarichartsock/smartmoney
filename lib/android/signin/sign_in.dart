import 'package:flutter/material.dart';

import '../components/styled_text_field.dart';
import '../components/styled_container.dart';

import '../../logic/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  Widget build(BuildContext context) {

    //Fetching height and width values of device
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    //Left and right margins of the screen.
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);
    double _containerHeight = _screenHeight - 56.0 - (_margin * 4);
    const double _padding = 8.0;

    //Storing theme as a variable to prevent long lines. This may or may not work. If theme doesn't work, change this first.
    ThemeData blocData = BlocProvider.of<ThemeBloc>(context).currentState;

    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));

    return Container(
      color: blocData.backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 56.0),
            child: AppBar(
              backgroundColor: blocData.canvasColor,
              shape: appBarBorder,
              leading: IconButton(
                iconSize: 24.0,
                icon: Icon(Icons.arrow_back),
                color: blocData.primaryColor,
                onPressed: () {
                  print("todo: pop stack");},
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          extendBody: false,
          backgroundColor: Colors.transparent,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: _margin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  StyledContainer(
                    verticalPadding: 16.0,
                    horizontalPadding: 16.0,
                    width: _containerWidth,
                    height: _containerWidth - (_margin  * 2.5),
                      child: Column(
                            children: <Widget>[
                              Text("Welcome back.",
                                  style: blocData.textTheme.display2),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text("Enter your information to log in.",
                                    style: blocData.textTheme.subtitle),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: _margin),
                                child: StyledTextField(null,"Email",1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: _margin),
                                child: StyledTextField(null, "Password", 1)),
                              Padding(
                                padding: const EdgeInsets.only(top: _margin),
                                child: RaisedButton(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(30.0)),
                                  onPressed: () {
                                    print("todo: route to next page");},
                                  color: blocData.primaryColor,
                                  child: Container(
                                    width: _containerWidth - _margin,
                                    height: 48.0,
                                    child: Center(
                                        child: Text("SIGN IN",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16))),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: _margin),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Don't have an account?",
                                      style: TextStyle(
                                        color: blocData.textTheme.display1.color,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700)
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("todo: move to next page.");
                                      },
                                      child: Text(
                                      " Sign Up",
                                      style: blocData.textTheme.button),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                      ),
                    ),
                ],
              ),
            ),
          )),
    );
  }
}