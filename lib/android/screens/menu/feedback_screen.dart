import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/styled_button.dart';
import 'package:smartmoney/android/components/styled_container.dart';
import 'package:smartmoney/android/components/styled_text_field.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Feedback extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  @override
  Widget build(BuildContext context) {

    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);
    double _containerHeight = _screenHeight - 56.0 - (_margin * 4);
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
    OutlineInputBorder greenBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: const BorderSide(
          width: 1.0,
          color: const Color(0xFF00E690), //#00e690
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
        resizeToAvoidBottomPadding: false,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60.0),
          child: AppBar(
            centerTitle: true,
            shape: appBarBorder,
            backgroundColor: Theme.of(context).canvasColor,
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("smartmoney", style: Theme.of(context).textTheme.display4),
            ),
            leading: IconButton(
              iconSize: 24.0,
              icon: Icon(Icons.arrow_back), //todo: add icon from icons8
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        extendBody: false,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: StyledContainer(
            width: _containerWidth,
            height: 450,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      "Send Feedback",
                      style: Theme.of(context).textTheme.display3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      "Any and all feedback is appreciated. Any issues, bugs reports, or feature suggestions will be read.",
                      style: Theme.of(context).textTheme.subtitle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: TextField(
                      expands: false,
                      maxLines: 1,
                      minLines: 1,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).canvasColor,
                        enabled: true,
                        labelStyle: Theme.of(context).textTheme.subtitle,
                        helperStyle: Theme.of(context).textTheme.subtitle,
                        labelText: "Title",
                        helperText: "Briefly descirbe the issue/suggestion.",
                        focusedErrorBorder: redBorder,
                        errorBorder: redBorder,
                        enabledBorder: greyBorder,
                        focusedBorder: greyBorder,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, bottom: 5.0),
                    child: TextField(
                      maxLines: 3,
                      minLines: 1,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).canvasColor,
                        enabled: true,
                        labelStyle: Theme.of(context).textTheme.subtitle,
                        helperStyle: Theme.of(context).textTheme.subtitle,
                        labelText: "Description",
                        helperText: "Describe the issue in detail.",
                        focusedErrorBorder: redBorder,
                        errorBorder: redBorder,
                        enabledBorder: greyBorder,
                        focusedBorder: greyBorder,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: _containerWidth - (120)),
                    child: StyledButton(
                      height: 56.0,
                      width: 56.0,
                      text: "SEND",
                      onPressed: () {
                        print("todo: send feedback to server.");
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
