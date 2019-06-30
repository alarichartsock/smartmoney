import 'package:flutter/material.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';
import 'package:smartmoney/android/screens/home/home_screen.dart';
import 'package:smartmoney/android/screens/signup/sign_up_screen.dart';

import '.././../logic/theme/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smartmoney/android/components/styled_button.dart';
import '../../components/styled_text_field.dart';
import '../../components/styled_container.dart';

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
    CustomThemeData customThemeData =
        BlocProvider.of<ThemeBloc>(context).currentState;

    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));

    return Container(
      color: customThemeData.backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 56.0),
            child: AppBar(
              backgroundColor: customThemeData.canvasColor,
              shape: appBarBorder,
              leading: IconButton(
                  iconSize: 24.0,
                  icon: Icon(Icons.arrow_back),
                  color: customThemeData.primaryColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
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
                    width: _containerWidth,
                    height: _containerWidth - (_margin * 2.0),
                    child: Padding(
                      padding: const EdgeInsets.all(_margin),
                      child: Column(
                        children: <Widget>[
                          Text("Welcome back.",
                              style: customThemeData.textTheme.h5),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text("Enter your information to log in.",
                                style: customThemeData.textTheme.subtitle1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: _margin),
                            child: StyledTextField(
                                labelText: "Email", maxLines: 1),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: _margin),
                              child: StyledTextField(
                                  labelText: "Password", maxLines: 1)),
                          Padding(
                              padding: const EdgeInsets.only(top: _margin),
                              child: StyledButton(
                                text: "SIGN IN",
                                width: _containerWidth - _margin,
                                height: 48.0,
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (context) => Home()));
                                },
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: _margin),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Don't have an account?",
                                    style: TextStyle(
                                        color:
                                            customThemeData.textTheme.h4.color,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400)),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SignUp()
                                      )
                                    );
                                  },
                                  child: Text(" Sign Up",
                                      style: customThemeData.textTheme.button),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
