import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/styled_button.dart';
import 'package:smartmoney/android/screens/signin/sign_in_screen.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _fullName;
  String _email;
  String _password;
  String _phoneNumber;

  bool nonProfessional = false;
  bool promotionalEmails = false;
  bool agreedToTerms = false;
  bool readTerms = false;

  Future<void> signUp() async {
    final formState = _formKey.currentState;

    if (formState.validate()) {
      try {
        print("{$_email},{$_password}");
        // FirebaseUser user =
        //     (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //   email: _email,
        //   password: _password,
        // ))
        //         .user;
        // print("{$user.iud}");
        // print("$user");
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Key emailKey;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);
    const double _padding = 8.0;

    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));
    OutlineInputBorder greyBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: const BorderSide(
          width: 1.0,
          color: const Color(0xFFBEC0C0), //#bec0c0
        ));
    OutlineInputBorder redBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: const BorderSide(
          width: 1.0,
          color: const Color(0xFFBEC0C0), //#f45531
        ));

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
          backgroundColor: Colors.transparent,
          body: ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: Theme.of(context).primaryColor,
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Material(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(8.0)),
                        elevation: 5.0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          width: _containerWidth,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Let's get started.",
                                      style:
                                          Theme.of(context).textTheme.display3),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Text(
                                        "Enter your information to create an account.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle),
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(top: _margin),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.text,
                                        validator: (String input) {
                                          if(input.isEmpty) {
                                            return "Please enter a name";
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (String input) =>
                                            _fullName = input,
                                        onChanged: (String input) {
                                          _fullName = input;
                                          
                                        },
                                            
                                        decoration: InputDecoration(
                                          fillColor:
                                              Theme.of(context).canvasColor,
                                          enabled: true,
                                          labelStyle: Theme.of(context)
                                              .textTheme
                                              .subtitle,
                                          labelText: "Full name",
                                          //helperText: (helperText != null) ? helperText : "",
                                          focusedErrorBorder: redBorder,
                                          errorBorder: redBorder,
                                          enabledBorder: greyBorder,
                                          focusedBorder: greyBorder,
                                        ),
                                      )),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(top: _margin),
                                      child: TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        validator: (String input) {
                                          Pattern pattern =
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regex = new RegExp(pattern);
                                          if (!regex.hasMatch(input)) {
                                            return 'Please enter a valid email';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (String input) =>
                                            _email = input,
                                        onChanged: (String input) =>
                                            _email = input,
                                        decoration: InputDecoration(
                                          fillColor:
                                              Theme.of(context).canvasColor,
                                          enabled: true,
                                          labelStyle: Theme.of(context)
                                              .textTheme
                                              .subtitle,
                                          labelText: "Email",
                                          //helperText: (helperText != null) ? helperText : "",
                                          focusedErrorBorder: redBorder,
                                          errorBorder: redBorder,
                                          enabledBorder: greyBorder,
                                          focusedBorder: greyBorder,
                                        ),
                                      )),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(top: _margin),
                                      child: TextFormField(
                                        obscureText: true,
                                        validator: (String input) {
                                          if (input.isEmpty) {
                                            return "Please enter a password.";
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (String input) =>
                                            _password = input,
                                        onChanged: (String input) =>
                                            _password = input,
                                        decoration: InputDecoration(
                                          fillColor:
                                              Theme.of(context).canvasColor,
                                          enabled: true,
                                          labelStyle: Theme.of(context)
                                              .textTheme
                                              .subtitle,
                                          labelText: "Password",
                                          //helperText: (helperText != null) ? helperText : "",
                                          focusedErrorBorder: redBorder,
                                          errorBorder: redBorder,
                                          enabledBorder: greyBorder,
                                          focusedBorder: greyBorder,
                                        ),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: _margin, bottom: 8.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (String input) {
                                          Pattern pattern = "^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}";
                                          RegExp regex = new RegExp(pattern);
                                          if (!regex.hasMatch(input)) {
                                            return 'Please enter a valid email';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (String input) =>
                                            _phoneNumber = input,
                                        onChanged: (String input) =>
                                            _phoneNumber = input,
                                        decoration: InputDecoration(
                                          fillColor:
                                              Theme.of(context).canvasColor,
                                          enabled: true,
                                          labelStyle: Theme.of(context)
                                              .textTheme
                                              .subtitle,
                                          labelText: "Phone number",
                                          //helperText: (helperText != null) ? helperText : "",
                                          focusedErrorBorder: redBorder,
                                          errorBorder: redBorder,
                                          enabledBorder: greyBorder,
                                          focusedBorder: greyBorder,
                                        ),
                                      )),
                                  CheckboxListTile(
                                    activeColor: Theme.of(context).primaryColor,
                                    dense: true,
                                    title: Text(
                                      "Professional subscriber",
                                      style:
                                          Theme.of(context).textTheme.display4,
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
                                    title: Row(
                                      children: <Widget>[
                                        Text(
                                          "Agree to",
                                          style: Theme.of(context)
                                              .textTheme
                                              .display4,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushNamed("/terms");
                                            readTerms = true;
                                          },
                                          child: Text(
                                            " terms and conditions",
                                            style: TextStyle(
                                                fontSize: Theme.of(context)
                                                    .textTheme
                                                    .display4
                                                    .fontSize,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    value: agreedToTerms,
                                    onChanged: (bool newValue) {
                                      if (readTerms == true) {
                                        setState(() {
                                          agreedToTerms = newValue;
                                        });
                                      } else {
                                        Navigator.of(context)
                                            .pushNamed("/terms");
                                        readTerms = true;
                                      }
                                    },
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: StyledButton(
                                        text: "SIGN UP",
                                        height: 48.0,
                                        width: _containerWidth - _margin,
                                        onPressed: () {
                                          signUp();
                                          // print(
                                          //     Navigator.of(context).toString());
                                          // Navigator.of(context)
                                          //     .pushNamed('/home');
                                        },
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: _padding * 3),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            print(Navigator.of(context)
                                                .toString());
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignIn()));
                                          },
                                          child: Text(" Sign In",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
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
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
