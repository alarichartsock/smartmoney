import 'package:flutter/material.dart';
import 'package:smartmoney/android/logic/theme/customTheme.dart';
import 'package:smartmoney/android/logic/theme/themes.dart';


class Settings extends StatefulWidget {

  bool darkThemeOn;

  Settings({ 
    this.darkThemeOn
  });

  @override
  _SettingsState createState() => _SettingsState(
    darkThemeOn: darkThemeOn
  );
}

class _SettingsState extends State<Settings> {

  _SettingsState({
    this.darkThemeOn
  });

  bool darkThemeOn;

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {

    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);

    RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)));

    return Scaffold(
      body: Container(
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
                child: Text("Settings", style: Theme.of(context).textTheme.title),
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
            child: Material(
              borderRadius: BorderRadius.all(const Radius.circular(8.0)),
              elevation: 5.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                width: _containerWidth,
                height: 230,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SwitchListTile(
                        title: Text("Dark mode", style: Theme.of(context).textTheme.display4,),
                        activeColor: Theme.of(context).primaryColor,
                        value: switchValue,
                        onChanged: (bool newValue) {
                          setState(() {
                           switchValue = newValue;
                           (newValue == true) ?
                           CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.DARK) :
                           CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.LIGHT);
                          });
                          
                        },
                      )
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
