import 'package:expenze_manager/screens/onboard_screens.dart';
import 'package:expenze_manager/service/expenz_service.dart';
import 'package:expenze_manager/service/income_service.dart';
import 'package:expenze_manager/service/store_userdata.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:expenze_manager/widgets/profilepage_actioncard.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "";
  String email = "";
  @override
  void initState() {
    // TODO: implement initState
    StoreUserData().getUserDetails().then((value) {
      if (value![0] != null) {
        setState(() {
          username = value[0];
          email = value[1];
        });
      }
    });

    super.initState();
  }

  //objects
  StoreUserData _userData = StoreUserData();
  ExpenzeService _expenzeService = ExpenzeService();
  IncomeService _incomeService = IncomeService();

  //bottom sheet for logout button
  void _shoeBottomLogoutSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.35,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: kccardShadow,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Logout?",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: kcHedingBlack),
              ),
              Text(
                "Are you sure do you wanna logout?",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kcDiscription),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //dismis the logout
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50),
                      decoration: BoxDecoration(
                          color: kcDiscription.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "No",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: kcHedingBlack),
                      ),
                    ),
                  ),
                  GestureDetector(
                    //logout
                    onTap: () async {
                      if (context.mounted) {
                        await _userData.removeUser();
                        await _expenzeService.removeAllExpenzes(context);
                        await _incomeService.removeAllIncomes(context);
                      }

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnBoardScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50),
                      decoration: BoxDecoration(
                          color: kcButtonBlue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: kcButtonText),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: [
                //user details
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "imageassets/81472305859204888_BLD_Online.jpg",
                          scale: 15,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: TextStyle(
                                color: kcHedingBlack,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            email,
                            style: TextStyle(
                                color: kcDiscription,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ]),
                    Icon(
                      Icons.edit,
                      size: 28,
                      color: kcHedingBlack,
                    )
                  ],
                ),
                //profile cards
                const SizedBox(
                  height: 30,
                ),
                //wallet card
                ProfilepageActioncard(
                  icon: Icons.wallet,
                  name: "Wallet",
                  color: kcButtonBlue,
                  logoutcolor: kccardShadow,
                ),
                const SizedBox(
                  height: 15,
                ),
                //setting card
                ProfilepageActioncard(
                  icon: Icons.settings,
                  name: "Setting",
                  color: kcButtonBlue,
                  logoutcolor: kccardShadow,
                ),
                const SizedBox(
                  height: 15,
                ),
                //export data card
                ProfilepageActioncard(
                  icon: Icons.download_for_offline,
                  name: "Export Data",
                  color: kcButtonBlue,
                  logoutcolor: kccardShadow,
                ),
                const SizedBox(
                  height: 15,
                ),
                //logout card
                GestureDetector(
                  //log out function
                  onTap: () {
                    _shoeBottomLogoutSheet(context);
                  },
                  child: ProfilepageActioncard(
                    icon: Icons.logout,
                    name: "Logout",
                    color: kcCardRed,
                    logoutcolor: kcCardRed.withOpacity(0.1),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
