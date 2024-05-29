import 'package:expenze_manager/data/linerchartdata.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LinerDigram extends StatefulWidget {
  const LinerDigram({super.key});

  @override
  State<LinerDigram> createState() => _LinerDigramState();
}

LinerDigramData data = LinerDigramData();

class _LinerDigramState extends State<LinerDigram> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 17 / 8,

      //set the linerchart
      child: LineChart(
        //set the showing linerchart data
        LineChartData(
          backgroundColor: kcButtonText,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          lineTouchData: const LineTouchData(enabled: true),
          //define border titles
          titlesData: const FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              shadow: Shadow(
                  blurRadius: 2, offset: Offset(1, 1), color: kcDiscription),
              barWidth: 6,
              color: kcButtonBlue,
              curveSmoothness: 0.3,
              isStrokeJoinRound: true,
              isStrokeCapRound: true,
              isCurved: true,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                    colors: [kcButtonBlue.withOpacity(0.3), Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              dotData: const FlDotData(show: false),
              spots: data.spots,
            ),
          ],
        ),
      ),
    );
  }
}
