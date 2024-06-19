import 'package:expenze_manager/model/expenzmodel.dart';
import 'package:expenze_manager/model/incomemodel.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:expenze_manager/widgets/categoryprogress_indicator.dart';
import 'package:expenze_manager/widgets/piechartdigram.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  final Map<ExpenzCategory, double> expenzMap;
  final Map<incomeCategory, double> incomeMap;

  const BudgetPage({
    super.key,
    required this.expenzMap,
    required this.incomeMap,
  });

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  int _pageChecker = 0;
  double amountE = 0;
  double amountI = 0;
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Financial Report",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kcButtonBlue),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kccardShadow),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //income button
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _pageChecker = 0;
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: _pageChecker == 0
                                      ? kcButtonBlue
                                      : kccardShadow),
                              child: Center(
                                child: Text(
                                  "Income",
                                  style: TextStyle(
                                      color: _pageChecker == 0
                                          ? kcButtonText
                                          : kcHedingBlack,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          //expenz button
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _pageChecker = 1;
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: _pageChecker == 1
                                      ? kcButtonBlue
                                      : kccardShadow),
                              child: Center(
                                child: Text(
                                  "Expenz",
                                  style: TextStyle(
                                      color: _pageChecker == 1
                                          ? kcButtonText
                                          : kcHedingBlack,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            
                //pie chart
                SizedBox(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: PieChartDigram(
                    expenzMap: widget.expenzMap,
                    incomeMap: widget.incomeMap,
                    isExpenz: _pageChecker == 1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //list view
                _pageChecker != 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: widget.expenzMap.length,
                        itemBuilder: (context, index) {
                          //get category
                          final category = widget.expenzMap.keys.toList()[index];
                          //get amount for each category
                          double amount = widget.expenzMap.values.toList()[index];
                          //get category color
                          final categoryColor = expenzColors[category]!;
                          return CategoryprogressIndicator(
                              category: category.name,
                              amount: amount,
                              total: amountE,
                              categoryColor: categoryColor);
                        },
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: widget.incomeMap.length,
                        itemBuilder: (context, index) {
                          //get category
                          final category = widget.incomeMap.keys.toList()[index];
                          //get amount for each category
                          double amount = widget.incomeMap.values.toList()[index];
                          //get category color
                          final categoryColor = incomeColors[category]!;
                          return CategoryprogressIndicator(
                              category: category.name,
                              amount: amount,
                              total: amountI,
                              categoryColor: categoryColor);
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
