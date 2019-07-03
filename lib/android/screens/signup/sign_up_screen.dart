import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/styled_button.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';
import 'package:smartmoney/android/screens/home/home_screen.dart';
import 'package:smartmoney/android/screens/signin/sign_in_screen.dart';

import '../../components/styled_text_field.dart';
import '../../components/styled_container.dart';

import '.././../logic/theme/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
Returns a screeen for users to enter their information.
todo: wrap data in a form and send to server. either firebase or in house.
This page is criminally undercompleted. It will probably need to be broken up into multiple pages.
But I'm building it out to about 50%, because I'd rather save myself the time in the future of doing all of the boring stuff.
*/
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

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
    CustomThemeData customThemeData = BlocProvider.of<ThemeBloc>(context).currentState;

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
                  print(Navigator.of(context).toString());
                  Navigator.of(context).pop();
                }
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          extendBody: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: StyledContainer(
              width: _containerWidth,
              height: _containerHeight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                        children: <Widget>[
                          Text("Let's get started.",
                              style: customThemeData.textTheme.h5),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text("Enter your information to create an account.",
                                style: customThemeData.textTheme.subtitle1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: _margin),
                            child: StyledTextField(
                              labelText: "First name",
                              maxLines: 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: _margin),
                            child: StyledTextField(labelText: "Last name", maxLines: 1)),
                          Padding(
                            padding: const EdgeInsets.only(top: _margin),
                            child: StyledTextField(labelText: "Email", maxLines: 1)),
                          Padding(
                            padding: const EdgeInsets.only(top: _margin),
                            child: StyledTextField(
                                helperText: "At least 7 characters", labelText: "Password", maxLines: 1)),
                          Padding(
                            padding: const EdgeInsets.only(top: _margin),
                            child: StyledTextField(labelText: "Phone number",maxLines: 1)),
                          Padding( //todo: add a mechanism to collapse the following mammoth text blurb.
                            padding: const EdgeInsets.only(top: _padding),
                            child: Text(
                              "Nonprofessional subscribers will use this information not in connection with any trade or business activities and not for the benefit of any other person. All Subscribers other than Nonprofessional Subscribers are classified as Professional Subscribers",
                              style: customThemeData.textTheme.subtitle2),
                          ),
                          //Checkbox(),
                          Padding(
                            padding: const EdgeInsets.only(top: _padding),
                            child: StyledButton(
                              text: "SIGN UP",
                              height: 48.0,
                              width: _containerWidth - _margin,
                              onPressed: () {
                                print(Navigator.of(context).toString());
                                Navigator.of(context).pushNamed('/home');
                              },
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: _padding * 3),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    color: customThemeData.textTheme.h3.color,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700)
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print(Navigator.of(context).toString());
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SignIn()
                                      )
                                    );
                                  },
                                  child: Text(
                                  " Sign In",
                                  style: customThemeData.textTheme.button),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                ),
            ),
          )),
    );
  }
}
