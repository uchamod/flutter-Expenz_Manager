import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  int _pageChecker = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Financial Report",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kcButtonBlue),
              ),
              const SizedBox(height: 10,),
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
            ],
          ),
        ),
      ),
    );
  }
}
