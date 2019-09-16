import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fl_chart/fl_chart.dart';

class BotCard extends StatefulWidget {
  @override
  _BotCardState createState() => _BotCardState();
}

class _BotCardState extends State<BotCard> {
  List<Color> gradientColors = [
    Color(0xff23b6e6),
    Color(0xff02d39a),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(const Radius.circular(8.0)),
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(
                color: Color(0xFFBEC0C0),
                width: 1.25,
                style: BorderStyle.solid)),
        // width: width,
        // height: height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Bot 1",
                    style: Theme.of(context).textTheme.display3,
                  ),
                  Text(
                    "\$5000 + 2.3%",
                    style: Theme.of(context).textTheme.display3,
                  ),
                ],
              ),
              Text("Classic Algorithms",
                  style: Theme.of(context).textTheme.subtitle),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  child: FlChart(
                    chart: LineChart(LineChartData(
                      extraLinesData: ExtraLinesData(
                          showHorizontalLines: false, showVerticalLines: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: 11,
                      minY: 0,
                      maxY: 6,
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 3),
                            FlSpot(2.6, 2),
                            FlSpot(4.9, 5),
                            FlSpot(6.8, 3.1),
                            FlSpot(8, 4),
                            FlSpot(9.5, 3),
                            FlSpot(11, 4),
                          ],
                          isCurved: true,
                          colors: gradientColors,
                          barWidth: 5,
                          isStrokeCapRound: true,
                          dotData: FlDotData(
                            show: false,
                          ),
                          belowBarData: BelowBarData(
                              show: false,
                              colors: [Theme.of(context).primaryColor]),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
