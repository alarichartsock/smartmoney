import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/styled_button.dart';
import 'package:smartmoney/android/components/styled_container.dart';
import 'package:smartmoney/android/components/styled_text_field.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';

import '.././../logic/theme/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    CustomThemeData customThemeData = BlocProvider.of<ThemeBloc>(context).currentState;

    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);

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
      color: customThemeData.backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60.0),
          child: AppBar(
            centerTitle: true,
            shape: appBarBorder,
            backgroundColor: customThemeData.canvasColor,
            title: Text("smartmoney", style: customThemeData.textTheme.h6),
            leading: IconButton(
              iconSize: 24.0,
              icon: Icon(Icons.arrow_back), //todo: add icon from icons8
              color: customThemeData.primaryColor,
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
            height: 230,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      "Help",
                      style: customThemeData.textTheme.h6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      "Enter your question and recieve an answer.",
                      style: customThemeData.textTheme.subtitle1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: TextField(
                      expands: false,
                      maxLines: 1,
                      minLines: 1,
                      decoration: InputDecoration(
                        fillColor: customThemeData.canvasColor,
                        enabled: true,
                        labelStyle: customThemeData.textTheme.subtitle1,
                        helperStyle: customThemeData.textTheme.subtitle1,
                        labelText: "Search",
                        //helperText: "Search your problem.",
                        focusedErrorBorder: redBorder,
                        errorBorder: redBorder,
                        enabledBorder: greyBorder,
                        focusedBorder: greyBorder,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: _containerWidth - (140), top: 16.0),
                    child: StyledButton(
                      height: 56.0,
                      width: 76.0,
                      text: "SEARCH",
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
