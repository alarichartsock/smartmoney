import 'package:flutter/material.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {

  bool acceptedTerms = false;

  RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)));
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

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 56.0),
            child: AppBar(
              centerTitle: true,
              title: Text(
                "",
                style: Theme.of(context).textTheme.title,
              ),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                  elevation: 5.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text("End User License Agreement (EULA) for Smartmoney", style: Theme.of(context).textTheme.display3,),
                          ), 
                          Text("Legal implications / description"),
                          // CheckboxListTile(
                          //           activeColor: Theme.of(context).primaryColor,
                          //           dense: true,
                          //           title: Text(
                          //             "I agree to the terms and conditions.",
                          //             style:
                          //                 Theme.of(context).textTheme.display4,
                          //           ),
                          //           value: acceptedTerms,
                          //           selected: acceptedTerms,
                          //           onChanged: (bool newValue) {
                          //             setState(() {
                          //               acceptedTerms = newValue;
                          //             });
                          //           },
                          //         ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
