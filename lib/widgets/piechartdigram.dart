import 'package:expenze_manager/model/expenzmodel.dart';
import 'package:expenze_manager/model/incomemodel.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartDigram extends StatefulWidget {
  final Map<ExpenzCategory, double> expenzMap;
  final Map<incomeCategory, double> incomeMap;
  final bool isExpenz;
  const PieChartDigram(
      {super.key,
      required this.expenzMap,
      required this.incomeMap,
      required this.isExpenz});

  @override
  State<PieChartDigram> createState() => _PieChartDigramState();
}

class _PieChartDigramState extends State<PieChartDigram> {
  double chatRadius = 40;
  double? amountE = 0;
  double? amountI = 0;

  List<PieChartSectionData> getSectionData() {
    if (widget.isExpenz) {
      return [
        PieChartSectionData(
          color: expenzColors[ExpenzCategory.entertainment],
          value: widget.expenzMap[ExpenzCategory.entertainment] ?? 0,
          radius: chatRadius,
          showTitle: false,
        ),
        PieChartSectionData(
          color: expenzColors[ExpenzCategory.food],
          value: widget.expenzMap[ExpenzCategory.food] ?? 0,
          radius: chatRadius,
          showTitle: false,
        ),
        PieChartSectionData(
          color: expenzColors[ExpenzCategory.helth],
          value: widget.expenzMap[ExpenzCategory.helth] ?? 0,
          radius: chatRadius,
          showTitle: false,
        ),
        PieChartSectionData(
          color: expenzColors[ExpenzCategory.vechical],
          value: widget.expenzMap[ExpenzCategory.vechical] ?? 0,
          radius: chatRadius,
          showTitle: false,
        ),
      ];
    } else {
      return [
        PieChartSectionData(
          color: incomeColors[incomeCategory.freelance],
          value: widget.incomeMap[incomeCategory.freelance] ?? 0,
          radius: chatRadius,
          showTitle: false,
        ),
        PieChartSectionData(
          color: incomeColors[incomeCategory.passive],
          value: widget.incomeMap[incomeCategory.passive] ?? 0,
          radius: chatRadius,
          showTitle: false,
        ),
        PieChartSectionData(
          color: incomeColors[incomeCategory.salary],
          value: widget.incomeMap[incomeCategory.salary] ?? 0,
          radius: chatRadius,
          showTitle: false,
        ),
        PieChartSectionData(
          color: incomeColors[incomeCategory.sales],
          value: widget.incomeMap[incomeCategory.sales] ?? 0,
          radius: chatRadius,
          showTitle: false,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    amountE = widget.expenzMap[ExpenzCategory.entertainment]! +
        widget.expenzMap[ExpenzCategory.food]! +
        widget.expenzMap[ExpenzCategory.helth]! +
        widget.expenzMap[ExpenzCategory.vechical]!;
    amountI = widget.incomeMap[incomeCategory.freelance]! +
        widget.incomeMap[incomeCategory.passive]! +
        widget.incomeMap[incomeCategory.salary]! +
        widget.incomeMap[incomeCategory.sales]!;
    return Stack(children: [
      widget.isExpenz
          ? Center(
              child: Text(
              "\$${amountE!.toStringAsFixed(0)}",
              style: TextStyle(
                  color: kcHedingBlack,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ))
          : Center(
              child: Text(
              "\$${amountI!.toStringAsFixed(0)}",
              style: TextStyle(
                  color: kcHedingBlack,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            )),
      PieChart(PieChartData(
        sections: getSectionData(),
        sectionsSpace: 0,
        centerSpaceRadius: 75,
        startDegreeOffset: -50,
      )),
    ]);
  }
}
