import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/styled_button.dart';
import '../../components/styled_text_field.dart';
import '../../components/styled_container.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //Fetching height and width values of device
    double _screenWidth = MediaQuery.of(context).size.width;
    //Left and right margins of the screen.
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);

    String _email;
    String _password;

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
                    //height: _containerWidth - (_margin * 2.0),
                    child: Padding(
                      padding: const EdgeInsets.all(_margin),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Welcome back.",
                                style: Theme.of(context).textTheme.display3),
                            Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "Enter your information to log in.",
                                  style: Theme.of(context).textTheme.subtitle,
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: _margin),
                                child: TextFormField(
                                  validator: (String input) {
                                    if (input.isEmpty) {
                                      return "Please enter an email.";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (String input) => _email = input,
                                  decoration: InputDecoration(
                                    fillColor: Theme.of(context).canvasColor,
                                    enabled: true,
                                    labelStyle:
                                        Theme.of(context).textTheme.subtitle,
                                    labelText: "Email or Phone",
                                    //helperText: (helperText != null) ? helperText : "",
                                    focusedErrorBorder: redBorder,
                                    errorBorder: redBorder,
                                    enabledBorder: greyBorder,
                                    focusedBorder: greyBorder,
                                  ),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: _margin),
                                child: TextFormField(
                                  validator: (String input) {
                                    if (input.isEmpty) {
                                      return "please enter a password";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: true,
                                  //key: _formKey,
                                  decoration: InputDecoration(
                                    fillColor: Theme.of(context).canvasColor,
                                    enabled: true,
                                    labelStyle:
                                        Theme.of(context).textTheme.subtitle,
                                    labelText: "Password",
                                    //helperText: (helperText != null) ? helperText : "",
                                    focusedErrorBorder: redBorder,
                                    errorBorder: redBorder,
                                    enabledBorder: greyBorder,
                                    focusedBorder: greyBorder,
                                  ),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: _margin),
                                child: StyledButton(
                                  text: "SIGN IN",
                                  width: _containerWidth - _margin,
                                  height: 48.0,
                                  onPressed: () {
                                    print(Navigator.of(context).toString());
                                    Navigator.of(context)
                                        .popUntil(ModalRoute.withName('/'));
                                    Navigator.of(context).pushNamed('/home');
                                    
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
                                          color: Theme.of(context)
                                              .textTheme
                                              .display2
                                              .color,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400)),
                                  GestureDetector(
                                    onTap: () {
                                      print(Navigator.of(context).toString());
                                      Navigator.of(context)
                                          .pushNamed("/signup");
                                    },
                                    child: Text(" Sign Up",
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
                ],
              ),
            ),
          )),
    );
  }
}
