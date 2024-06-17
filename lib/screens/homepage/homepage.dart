import 'package:expenze_manager/service/store_userdata.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:expenze_manager/widgets/fullexpenzshowwidget.dart';
import 'package:expenze_manager/widgets/linerdigram.dart';
import 'package:expenze_manager/widgets/reusableitem.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
 // final List<dynamic> cardList;
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";
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
    super.initState();
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
                      FullExpenzShowCard(
                          icon: Icons.arrow_downward_rounded,
                          title: "Income",
                          amount: "\$1000",
                          color: kcCardGreen),
                      FullExpenzShowCard(
                          icon: Icons.arrow_upward,
                          title: "Expenz",
                          amount: "\$1500",
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
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                    child: ListView.builder(
                  
                     
                      itemBuilder: (context, index) {
                       
                      },
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
