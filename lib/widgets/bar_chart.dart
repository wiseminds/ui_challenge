import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartView extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartView> {
  final Color barBackgroundColor = Colors.white;
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      // isPlaying ? randomData() :
       mainBarData(),
      swapAnimationDuration: animDuration,
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.blue,
    double width = 30,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barsSpace: 0,
      barRods: [
        BarChartRodData(borderRadius: BorderRadius.circular(7),
          y: isTouched ? y + 1 : y,
          color: isTouched ? Colors.yellow : barColor,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 10,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(9, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 4, isTouched: i == touchedIndex, barColor: Theme.of(context).accentColor.withOpacity(.3));
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex, barColor: Theme.of(context).accentColor.withOpacity(.3));
          case 2:
            return makeGroupData(2, 3, isTouched: i == touchedIndex, barColor: Theme.of(context).accentColor.withOpacity(.3));
          case 3:
            return makeGroupData(3, 5, isTouched: i == touchedIndex, barColor: Theme.of(context).accentColor.withOpacity(.3));
          case 4:
            return makeGroupData(4, 1, isTouched: i == touchedIndex, barColor: Theme.of(context).accentColor.withOpacity(.3));
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex, barColor: Theme.of(context).accentColor.withOpacity(.3));
          case 6:
            return makeGroupData(5, 5, isTouched: i == touchedIndex, barColor: Theme.of(context).accentColor.withOpacity(.3));  
             case 7:
            return makeGroupData(5, 7.5, isTouched: i == touchedIndex, barColor: Theme.of(context).accentColor.withOpacity(.9));  
          case 8:
            return makeGroupData(6, 10.5, isTouched: i == touchedIndex, barColor: Theme.of(context).accentColor.withOpacity(.3));
          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      backgroundColor: Colors.white,
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Febuary';
                  break;
                case 0:
                  weekDay = 'March';
                  break;
                case 1:
                  weekDay = 'April';
                  break;
                case 2:
                  weekDay = 'May';
                  break;
                case 3:
                  weekDay = 'June';
                  break;
                case 4:
                  weekDay = 'July';
                  break;
                case 5:
                  weekDay = 'August';
                  break;
                   case 6:
                  weekDay = 'September';
                  break;
                    case 7:
                  weekDay = 'October';
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 1).toString(), TextStyle(color: Colors.yellow));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(color: Colors.black.withOpacity(.2), fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 1:
                return 'feb';
              case 2:
                return '';
              case 3:
                return 'apr';
              case 4:
                return '';
              case 5:
                return 'jun';
              case 6:
                return '';
              case 7:
                return 'aug';
                case 7:
                return '';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      groupsSpace: 20, 
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'feb';
              case 1:
                return '';
              case 2:
                return 'apr';
              case 3:
                return '';
              case 4:
                return 'jun';
              case 5:
                return 'aug';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 1:
            return makeGroupData(1, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 2:
            return makeGroupData(2, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 3:
            return makeGroupData(3, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 4:
            return makeGroupData(4, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 5:
            return makeGroupData(5, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 6:
            return makeGroupData(6, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          default:
            return null;
        }
      }),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(animDuration + const Duration(milliseconds: 50));
    if (isPlaying) {
      refreshState();
    }
  }
}