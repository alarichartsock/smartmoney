import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/styled_button.dart';
import 'package:smartmoney/android/components/styled_container.dart';

import 'package:toast/toast.dart';

class Feedback extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
//Alaric todo: give each user 10 or so allowed feedbacks to avoid spam. Waiting until accounts are a thing.

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    OutlineInputBorder redBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: const BorderSide(
          width: 1.0,
          color: const Color(0xFFBEC0C0), //#f45531
        ));

    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    String title;
    String description;

    void _sendToServer(String localTitle, String localDescription) {
      if (_formKey.currentState.validate()) { 
        Toast.show("Your input is appreciated.", context,
            duration: 2,
            backgroundColor: Theme.of(context).focusColor,
            textColor: Theme.of(context).canvasColor);
        //Aidan todo: integrate to firebase.
        title = null;
        description = null;
        titleController.clear();
        descriptionController.clear();
      } else {
        
      }
    }

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
              child:
                  Text("smartmoney", style: Theme.of(context).textTheme.title),
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
        backgroundColor: Colors.transparent,
        body: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Theme.of(context).primaryColor,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: StyledContainer(
                    width: _containerWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Form(
                        key: _formKey,
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Send Feedback",
                              style: Theme.of(context).textTheme.display3,
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
                              child: TextFormField(
                                validator: (String text) {
                                  if(text.isEmpty) {
                                    return "Please enter a title.";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (text) => title = text,
                                controller: titleController,
                                decoration: InputDecoration(
                                  fillColor: Theme.of(context).canvasColor,
                                  enabled: true,
                                  labelStyle:
                                      Theme.of(context).textTheme.subtitle,
                                  helperStyle:
                                      Theme.of(context).textTheme.subtitle,
                                  labelText: "Title",
                                  focusedErrorBorder: redBorder,
                                  errorBorder: redBorder,
                                  enabledBorder: greyBorder,
                                  focusedBorder: greyBorder,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 14.0, bottom: 5.0),
                              child: TextFormField(
                                  validator: (String text) {
                                  if(text.isEmpty) {
                                    return "Please enter a description.";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (text) => description = text,
                                controller: descriptionController,
                                minLines: 1,
                                maxLines: 100,
                                decoration: InputDecoration(
                                  fillColor: Theme.of(context).canvasColor,
                                  enabled: true,
                                  labelStyle:
                                      Theme.of(context).textTheme.subtitle,
                                  helperStyle:
                                      Theme.of(context).textTheme.subtitle,
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
                              padding:
                                  EdgeInsets.only(left: _containerWidth - (120)),
                              child: StyledButton(
                                height: 56.0,
                                width: 56.0,
                                text: "SEND",
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(new FocusNode()); // Lowers keyboard.
                                  print("$title"); //These print statements are for debugging purposes.
                                  print("$description");
                                  _sendToServer(title, description);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
