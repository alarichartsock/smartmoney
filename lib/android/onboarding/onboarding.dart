import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/themebloc.dart';

/*
Align our 3 OnboaringPages and one PromptPage in a Pageview, recieve when a user taps next and turn the page.
*/
class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {

  PageController _pageController = new PageController();
  int currentpage = 0;

  void jumpForward() {
    _pageController.nextPage(
        curve: Curves.easeIn, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        OnboardingPage(
            "Trade Smart",
            "Filter stocks by metrics like short interest and short interest change.",
            0,
            jumpForward),
        OnboardingPage(
            "Connect",
            "Get alerts when hedge funds and institutional investors make large trades.",
            1,
            jumpForward),
        OnboardingPage(
            "Get an Edge",
            "View legal insider trades filed with the SEC, made by top executives.",
            2,
            jumpForward),
        PromptScreen(),
      ],
    );
  }
}

/*
  Returns an OnboardingPage with tile, description, and image fields. 
*/
class OnboardingPage extends StatefulWidget {
  String title;
  String description;
  int id;
  VoidCallback nextPressed;

  OnboardingPage(
    this.title,
    this.description,
    this.id,
    this.nextPressed,
  ) {}

  @override
  _OnboardingPageState createState() => _OnboardingPageState(
      title: title, description: description, id: id, nextPressed: nextPressed);
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  _OnboardingPageState(
      {this.title, this.description, this.id, this.nextPressed});

  String title;
  String description;
  int id;
  VoidCallback nextPressed;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context)
        .size
        .height; //fetching width and height values of device
    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0; //left and right margins
    double _containerWidth = _screenWidth - (_margin * 2);
    const double _padding = 8.0;

    ThemeData blocData = BlocProvider.of<ThemeBloc>(context)
        .currentState; //storing as a variable to prevent long lines. cut down if not needed.

    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.transparent,
      body: Container(
        //background
        color: BlocProvider.of<ThemeBloc>(context).currentState.backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
              //todo: add images to top
              borderRadius: BorderRadius.all(const Radius.circular(8.0)),
              elevation: 5.0,
              child: Container(
                // Aspect ratio is 1:1.
                width: _containerWidth,
                height: _containerWidth - _margin,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                  color: BlocProvider.of<ThemeBloc>(context)
                      .currentState
                      .canvasColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: _margin),
              child: Material(
                borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                elevation: 5.0,
                child: Container(
                    // Aspect ratio is 1:1.
                    width: _containerWidth,
                    height: 2 / 3 * (_containerWidth - _margin),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(8.0)),
                      color: blocData.canvasColor,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: _margin * 2,
                                left: _margin,
                                right: _margin),
                            child: Text(
                              "$title",
                              style: blocData.textTheme.display3,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: _margin, left: _margin, right: _margin),
                            child: Text(
                              "$description",
                              style: blocData.textTheme.title,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 32, bottom: 40.0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: (_containerWidth / 2) - 32),
                                      child: Container(
                                        width: 16.0,
                                        height: 16.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(8.0)),
                                          color: blocData.primaryColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        width: 16.0,
                                        height: 16.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(8.0)),
                                          color: blocData.primaryColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        width: 16.0,
                                        height: 16.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(8.0)),
                                          color: blocData.primaryColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: GestureDetector(
                                        child: Text("NEXT",
                                            style: blocData.textTheme.button),
                                        onTap: () {
                                          nextPressed();
                                        },
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                    
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
  Returns a hard coded Promptscreen, prompting a user to either log in or sign up.
*/
class PromptScreen extends StatefulWidget {
  @override
  _PromptScreenState createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context)
        .size
        .height; //fetching width and height values of device
    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0; //left and right margins
    double _containerWidth = _screenWidth - (_margin * 2);
    const double _padding = 8.0;

    ThemeData blocData = BlocProvider.of<ThemeBloc>(context)
        .currentState; //storing as a variable to prevent long lines. cut down if not needed.

    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.transparent,
      body: Container(
        //background
        color: BlocProvider.of<ThemeBloc>(context).currentState.backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
              //todo: add images to top
              borderRadius: BorderRadius.all(const Radius.circular(8.0)),
              elevation: 5.0,
              child: Container(
                width: _containerWidth,
                height: 53/48 * _containerWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                  color: BlocProvider.of<ThemeBloc>(context)
                      .currentState
                      .canvasColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: _margin),
              child: Material(
                borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                elevation: 5.0,
                child: Container(
                    // Aspect ratio is 1:1.
                    width: _containerWidth,
                    height: 24/48 * (_containerWidth),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(8.0)),
                      color: blocData.canvasColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: _margin),
                          child: Text(
                            "Smartmoney",
                            style: blocData.textTheme.display3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: _padding),
                          child: Text(
                            "Elevate your trading.",
                            style: blocData.textTheme.title,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                onPressed: () {
                                  print("todo: route to next page");
                                },
                                color: blocData.primaryColor,
                                child: Container(
                                  width: 1 / 3 * _screenWidth,
                                  height: 48.0,
                                  child: Center(
                                      child: Text("SIGN IN",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16))),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: _padding * 3),
                                child: RaisedButton(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  onPressed: () {
                                    print("todo: route to next page");
                                  },
                                  color: blocData.primaryColor,
                                  child: Container(
                                    width: 1 / 3 * _screenWidth,
                                    height: 48.0,
                                    child: Center(
                                        child: Text("SIGN UP",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
