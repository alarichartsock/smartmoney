import 'package:flutter/material.dart';
import 'package:smartmoney/android/logic/data/bot.dart';

class BotMarketplaceCard extends StatefulWidget {
  Bot bot;

  BotMarketplaceCard({this.bot});

  @override
  _BotMarketplaceCardState createState() => _BotMarketplaceCardState(bot: bot);
}

class _BotMarketplaceCardState extends State<BotMarketplaceCard> {
  Bot bot;
  _BotMarketplaceCardState({this.bot});

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.all(const Radius.circular(8.0)),
        elevation: 5.0,
        child: Container(
          width: MediaQuery.of(context).size.width - 64,
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(
                  color: Color(0xFFBEC0C0),
                  width: 1.25,
                  style: BorderStyle.solid)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 40.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Bot name",
                            style: Theme.of(context).textTheme.display3,
                          ),
                          Text(
                            "Brief description",
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  iconSize: 25.0,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    print("add to card pressed. add a hero image next.");
                  },
                  icon: Icon(Icons.add),
                )
              ],
            ),
          ),
        ));
  }
}
