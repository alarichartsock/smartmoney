import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/styled_button.dart';
import 'package:smartmoney/android/screens/home/home_screen.dart';
import 'package:smartmoney/android/screens/signin/sign_in_screen.dart';

import '../../components/styled_text_field.dart';
import '../../components/styled_container.dart';

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
  bool nonProfessional = false;
  bool promotionalEmails = false;
  bool termsAndConditions = false;

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

    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));

    return Container(
      color: Theme.of(context).backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 56.0),
            child: AppBar(
              backgroundColor: Theme.of(context).canvasColor,
              shape: appBarBorder,
              leading: IconButton(
                  iconSize: 24.0,
                  icon: Icon(Icons.arrow_back),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    print(Navigator.of(context).toString());
                    Navigator.of(context).pop();
                  }),
            ),
          ),
          resizeToAvoidBottomInset: false,
          extendBody: false,
          backgroundColor: Colors.transparent,
          body: ListView(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Material(
                    borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                    elevation: 5.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      width: _containerWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Let's get started.",
                                style: Theme.of(context).textTheme.display3),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                  "Enter your information to create an account.",
                                  style: Theme.of(context).textTheme.subtitle),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: _margin),
                              child: StyledTextField(
                                  labelText: "Full name", maxLines: 1),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: _margin),
                                child: StyledTextField(
                                    labelText: "Email", maxLines: 1)),
                            Padding(
                                padding: const EdgeInsets.only(top: _margin),
                                child: StyledTextField(
                                    helperText: "At least 7 characters",
                                    labelText: "Password",
                                    maxLines: 1)),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: _margin, bottom: 8.0),
                                child: StyledTextField(
                                    labelText: "Phone #", maxLines: 1)),
                            CheckboxListTile(
                              activeColor: Theme.of(context).primaryColor,
                              dense: true,
                              title: Text(
                                "Nonprofessional subscriber",
                                style: Theme.of(context).textTheme.display4,
                              ),
                              value: nonProfessional,
                              selected: nonProfessional,
                              onChanged: (bool newValue) {
                                setState(() {
                                  nonProfessional = newValue;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: Text("Send me promotional emails"),
                              activeColor: Theme.of(context).primaryColor,
                              value: promotionalEmails,
                              onChanged: (bool newValue) {
                                setState(() {
                                  promotionalEmails = newValue;
                                });
                              },
                            ),
                            CheckboxListTile(
                              activeColor: Theme.of(context).primaryColor,
                              selected: true,
                              dense: true,
                              title: Text(
                                "Agree to terms and conditions",
                                style: Theme.of(context).textTheme.display4,
                              ),
                              value: termsAndConditions,
                              onChanged: (bool newValue) {
                                print("recieved");
                                setState(() {
                                  termsAndConditions = newValue;
                                });
                              },
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: StyledButton(
                                  text: "SIGN UP",
                                  height: 48.0,
                                  width: _containerWidth - _margin,
                                  onPressed: () {
                                    print(Navigator.of(context).toString());
                                    Navigator.of(context).pushNamed('/home');
                                  },
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: _padding * 3),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Already have an account?",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .display1
                                              .color,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700)),
                                  GestureDetector(
                                    onTap: () {
                                      print(Navigator.of(context).toString());
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => SignIn()));
                                    },
                                    child: Text(" Sign In",
                                        style:
                                            Theme.of(context).textTheme.button),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
