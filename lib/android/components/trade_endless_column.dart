import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmoney/android/components/styled_container.dart';
import 'package:smartmoney/android/components/order_card.dart';
import 'package:smartmoney/android/logic/theme/custom_theme.dart';
import '.././logic/theme/themebloc.dart';

/*
EndlessOrderColumn is a styled container with TradeCards arranged horizontally. 
It's intended for the user to scroll as long as they want, and it has an IconButton to open a settings so that they can filter the StockCards that they want.
*/

class EndlessOrderColumn extends StatefulWidget {
  @override
  _EndlessOrderColumnState createState() => _EndlessOrderColumnState();
}

class _EndlessOrderColumnState extends State<EndlessOrderColumn> {


  @override
  Widget build(BuildContext context) {

    CustomThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;

    return StyledContainer(
      
    );
  }
}