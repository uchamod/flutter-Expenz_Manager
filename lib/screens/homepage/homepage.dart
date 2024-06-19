import 'package:expenze_manager/model/expenzmodel.dart';
import 'package:expenze_manager/model/incomemodel.dart';
import 'package:expenze_manager/service/store_userdata.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:expenze_manager/widgets/fullexpenzshowwidget.dart';
import 'package:expenze_manager/widgets/linerdigram.dart';
import 'package:expenze_manager/widgets/reusableitem.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<Expenzes>? expenzList;
  final List<Incomes>? incomeList;
  const HomePage({
    super.key,
    required this.expenzList, this.incomeList,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";
  double  totalExpenz=0;
  double totalIncome=0;
  // List<Expenzes> expenzWrapperList = DataWrapper().expenzList;
  // List<Incomes> incomeWrapperList = DataWrapper().incomeList;

  @override
  void initState() {
    // TODO: implement initState
    StoreUserData().getUserDetails().then((value) {
      if (value![0] != null) {
        setState(() {
          username = value[0];
        });
       
      }
    });
     setState(() {
          for (var i = 0; i < widget.expenzList!.length; i++) {
            totalExpenz += widget.expenzList![i].amount;
          }
          for (var i = 0; i < widget.incomeList!.length; i++) {
            totalIncome += widget.incomeList![i].amount;
          }
        });
   // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.285,
            decoration: BoxDecoration(
              color: kcButtonBlue.withOpacity(0.7),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 50, 15, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //user identity section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "imageassets/81472305859204888_BLD_Online.jpg",
                          scale: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "Welcome $username",
                        style: TextStyle(
                            color: kcButtonText,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.notifications,
                        size: 24,
                        color: kcButtonText,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //income card
                      FullExpenzShowCard(
                          icon: Icons.arrow_downward_rounded,
                          title: "Income",
                          amount: totalIncome,
                          color: kcCardGreen),
                          //expenz card
                      FullExpenzShowCard(
                          icon: Icons.arrow_upward,
                          title: "Expenz",
                          amount: totalExpenz,
                          color: kcCardRed)
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Spend Frequency",
                    style: TextStyle(
                        color: kcHedingBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //line chart
                  const LinerDigram(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Recent Transaction",
                    style: TextStyle(
                        color: kcHedingBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                 
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          widget.expenzList!.isEmpty
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 110),
                                  child: Center(
                                    child: Text(
                                      "add some expenzes",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: kcDiscription),
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: widget.expenzList!.length,
                                  itemBuilder: (context, index) {
                                    //  fetchExpenzes();
                                    final Expenzes? expenz =
                                        widget.expenzList![index];
                                    //convet to dismisable
                                    return ReusableItem(
                                        color: expenzColors[expenz!.catrgory]!,
                                        title: expenz.title,
                                        discription: expenz.discription,
                                        amount: expenz.amount,
                                        time: expenz.date,
                                        image: expenzCategoryImages[
                                            expenz.catrgory]!);
                                  }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  // Color widgetColor(item){

  //   if(itme.catrgory==incomeCategory.freelance){

  //   }
  // }
}
