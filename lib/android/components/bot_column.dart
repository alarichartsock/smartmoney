import 'package:flutter/material.dart';
import 'package:smartmoney/android/components/bot_marketplace_card.dart';
import 'package:smartmoney/android/logic/data/bot.dart';

class BotColumn extends StatefulWidget {
  String title;
  String description;
  List<Bot> bots;

  BotColumn({
    this.title,
    this.description,
    this.bots,
  });

  @override
  _BotColumnState createState() =>
      _BotColumnState(title: title, description: description, bots: bots);
}

class _BotColumnState extends State<BotColumn> {
  String title;
  String description;
  List<Bot> bots;

  _BotColumnState({this.bots, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.all(const Radius.circular(8.0)),
        elevation: 5.0,
        child: Container(
          width: MediaQuery.of(context).size.width - 32,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$title",
                  style: Theme.of(context).textTheme.display3,
                ),
                Text(
                  "$description",
                  style: Theme.of(context).textTheme.subtitle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: BotMarketplaceCard(
                    bot: bots[0],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: BotMarketplaceCard(
                    bot: bots[1],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: BotMarketplaceCard(bot: bots[2]),
                ),
                GestureDetector(
                  onTap: () {
                    print("should be opening");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          "SEE MORE",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
