import 'package:expenze_manager/screens/userdetails.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:expenze_manager/widgets/itemaddingform.dart';
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
  //show amount
  double _showAmount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _pageChecker == 0 ? kcCardGreen : kcCardRed,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //add main column
            child: Column(
              children: [
                Expanded(
                  //stack
                  child: Stack(
                    children: [
                      //first layer
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
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
                        ),
                      ),

                      Positioned(
                        top: 100,
                        child: Column(
                          children: [
                            Text(
                              "How much?",
                              style: TextStyle(
                                  color: kcButtonText.withOpacity(0.8),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              _showAmount.toInt().toString(),
                              style: TextStyle(
                                  color: kcButtonText,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      //second layer
                      Positioned(
                          bottom: 20,
                          right: 15,
                          child: FloatingActionButton(
                            backgroundColor: kcButtonText,
                            splashColor: kcDiscription,
                            child: Icon(
                              Icons.add,
                              size: 35,
                              color: kcButtonBlue,
                            ),
                            //modalbuttonsheet for show the expenz adding form
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    //form sheet
                                    return ItemAddingForm(
                                      checker: _pageChecker,
                                    );
                                  });
                            },
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
