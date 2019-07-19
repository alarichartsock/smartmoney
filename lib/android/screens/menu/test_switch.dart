import 'package:flutter/material.dart';

class TestSwitch extends StatefulWidget {
  @override
  _TestSwitchState createState() => _TestSwitchState();
}

class _TestSwitchState extends State<TestSwitch> {

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: customThemeData.backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60.0),
            child: AppBar(
              centerTitle: true,
              //title: Text("yeet", style: customThemeData.textTheme.h6),
              leading: IconButton(
                iconSize: 24.0,
                icon: Icon(Icons.arrow_back), //todo: add icon from icons8
                //color: customThemeData.primaryColor,
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
            child: Container(
              color: Colors.white,
              //width: _containerWidth,
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
                        "Settings",
                        //style: customThemeData.textTheme.h6,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Switch(
                        value: switchValue,
                        onChanged: (bool value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                      ),
                    ),
                    //Padding(
                      //padding: EdgeInsets.only(
                          //left: _containerWidth - (140), top: 16.0),
                      //child: 
                      
                    
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}