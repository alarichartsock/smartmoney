import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartmoney/android/components/styled_container.dart';
import 'package:smartmoney/android/components/trade_card.dart';
import '../../logic/themebloc.dart';

/*
EndlessTradeColumn is a styled container with TradeCards arranged horizontally. 
It's intended for the user to scroll as long as they want, and it has an IconButton to open a settings so that they can filter the StockCards that they want.

*/
class EndlessTradeColumn extends StatefulWidget {
  @override
  _EndlessTradeColumnState createState() => _EndlessTradeColumnState();
}

class _EndlessTradeColumnState extends State<EndlessTradeColumn> {


  @override
  Widget build(BuildContext context) {

    ThemeData themeData = BlocProvider.of<ThemeBloc>(context).currentState;

    return StyledContainer(
      
    );
  }
}