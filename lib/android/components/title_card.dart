import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmoney/android/components/styled_container.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';
import 'package:smartmoney/android/logic/theme/themebloc.dart';

class TitleCard extends StatefulWidget {

  double width;

  TitleCard({
    this.width,
  });



  @override
  _TitleCardState createState() => _TitleCardState(
    width: width
  );
}

class _TitleCardState extends State<TitleCard> {

  double width;

  _TitleCardState({
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    CustomThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;
    
    return StyledContainer(
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Browse trades", style: themeData.textTheme.h5,),
            Text("View largest trades on the stock market.", style: themeData.textTheme.subtitle1,),
          ],
        ),
      ),
    );
  }
}