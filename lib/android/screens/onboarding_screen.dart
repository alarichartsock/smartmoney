import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmoney/android/components/styled_button.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';

import '.././logic/theme/themebloc.dart';
import '../components/styled_container.dart';

/*
Onboarding aligns our 3 OnboardingPages & one PromptPage in a Pageview, and recieves when a user taps next and turn the page.
*/
class Onboarding extends StatefulWidget {
  final bool showImages;

  Onboarding({this.showImages});

  @override
  _OnboardingState createState() => _OnboardingState(showImages: showImages);
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  final bool showImages;

  _OnboardingState({
    this.showImages,
  });

  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(
      initialPage: (showImages == true) ? 0 : 3,
    );

    void jumpForward() {
      _pageController.nextPage(
          curve: Curves.easeIn, duration: Duration(milliseconds: 200));
    }

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
  final String title;
  final String description;
  final int id;
  final VoidCallback nextPressed;

  OnboardingPage(
    this.title,
    this.description,
    this.id,
    this.nextPressed,
  );

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
    //Fetching width and height values of device.
    double screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    //Left and right margins of the screen.
    const double _margin = 16.0;
    double _containerWidth = _screenWidth - (_margin * 2);
    const double _padding = 8.0;

    CustomThemeData customThemeData = BlocProvider.of<ThemeBloc>(context)
        .currentState; //storing as a variable to prevent long lines. cut down if not needed.

    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.transparent,
      body: Container(
        //background
        color: customThemeData.backgroundColor,
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
                    color: customThemeData.canvasColor),
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
                      color: customThemeData.canvasColor,
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
                                  style: customThemeData.textTheme.h4,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: _margin,
                                    left: _margin,
                                    right: _margin),
                                child: Text(
                                  "$description",
                                  style: customThemeData.textTheme.h6,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: (_containerWidth / 2) - 32),
                                        child: Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: customThemeData.primaryColor,
                                              width: 3.0,
                                              style: BorderStyle.solid
                                            ),
                                            borderRadius: BorderRadius.all(
                                                const Radius.circular(8.0)
                                                ),
                                            color: (id >= 0) ? customThemeData.primaryColor : Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 3.0,
                                              style: BorderStyle.solid,
                                              color: customThemeData.primaryColor
                                            ),
                                            borderRadius: BorderRadius.all(
                                                const Radius.circular(8.0)),
                                            color: (id >= 1) ? customThemeData.primaryColor : Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 3.0,
                                              style: BorderStyle.solid,
                                              color: customThemeData.primaryColor
                                            ),
                                            borderRadius: BorderRadius.all(
                                                const Radius.circular(8.0)),
                                            color: (id >= 2) ? customThemeData.primaryColor : Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: GestureDetector(
                                          child: Text("NEXT",
                                              style: customThemeData
                                                  .textTheme.button),
                                          onTap: () {
                                            nextPressed();
                                            print(Navigator.of(context).toString());
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
    double screenHeight = MediaQuery.of(context).size.height; //fetching width and height values of device
    double _screenWidth = MediaQuery.of(context).size.width;
    const double _margin = 16.0; //left and right margins
    double _containerWidth = _screenWidth - (_margin * 2);
    const double _padding = 8.0;

    CustomThemeData customThemeData = BlocProvider.of<ThemeBloc>(context)
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
            StyledContainer(
              width: _containerWidth,
              height: 53 / 48 * _containerWidth,
              horizontalInternalPadding: 0.0,
              verticalInternalPadding: 0.0,
              child: null,
            ),
            Padding(
              padding: const EdgeInsets.only(top: _margin),
              child: StyledContainer(
                  width: _containerWidth,
                  height: 24 / 48 * (_containerWidth),
                  verticalInternalPadding: 0.0,
                  horizontalInternalPadding: 0.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: _margin),
                        child: Text(
                          "Smartmoney",
                          style: customThemeData.textTheme.h4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: _padding),
                        child: Text(
                          "Elevate your trading.",
                          style: customThemeData.textTheme.h6,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(left: _margin),
                                child: StyledButton(
                                  text: "SIGN IN",
                                  width: 2 / 7 * _screenWidth,
                                  height: 48.0,
                                  onPressed: () {
                                    print(Navigator.of(context).toString());
                                    Navigator.of(context).pushNamed("/signin");
                                  },
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: _padding * 3, right: _margin),
                                child: StyledButton(
                                  text: "SIGN UP",
                                  width: 2 / 7 * _screenWidth,
                                  height: 48.0,
                                  onPressed: () {
                                    print(Navigator.of(context).toString());
                                    Navigator.of(context).pushNamed('/signup');                          
                                  },
                                )),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
