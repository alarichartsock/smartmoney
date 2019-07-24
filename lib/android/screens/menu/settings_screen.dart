import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/styled_button.dart';
import 'package:smartmoney/android/components/styled_container.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';

import '.././../logic/theme/themebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    CustomThemeData customThemeData =
        BlocProvider.of<ThemeBloc>(context).currentState;

    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);

    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));

    return Scaffold(
      body: Container(
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
              title: Text("Settings", style: customThemeData.textTheme.h6),
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
            child: Material(
              borderRadius: BorderRadius.all(const Radius.circular(8.0)),
              elevation: 5.0,
              child: Container(
                decoration: BoxDecoration(
                  color: customThemeData.canvasColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                width: _containerWidth,
                height: 230,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 4.0),
                      //   child: SwitchListTile(
                      //     dense: true,
                      //     title: Text("Dark theme", style: customThemeData.textTheme.subtitle1),
                      //     value: switchValue,
                      //     onChanged: (bool value) {
                      //       (value == true)
                      //             ? BlocProvider.of<ThemeBloc>(context)
                      //                 .dispatch(ThemeEvent.darkEvent)
                      //             : BlocProvider.of<ThemeBloc>(context)
                      //                 .dispatch(ThemeEvent.lightEvent);
                      //       setState(() {
                      //         switchValue = value;
                      //       });
                      //     },
                      //   ),
                      // ),
                    ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
