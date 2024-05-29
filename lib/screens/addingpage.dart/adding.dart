import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  // income =0 expenz=1
  int _pageChecker = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _pageChecker == 0 ? kcCardGreen : kcCardRed,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SingleChildScrollView(
              //create a stack
              child: Stack(
                children: [
                  //first layer
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        //togle button
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: kcButtonText),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: _pageChecker == 0
                                            ? kcButtonBlue
                                            : kcButtonText),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: _pageChecker == 1
                                            ? kcButtonBlue
                                            : kcButtonText),
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
