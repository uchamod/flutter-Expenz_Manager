import 'dart:async';

import 'package:expenze_manager/model/expenzmodel.dart';
import 'package:expenze_manager/model/incomemodel.dart';
import 'package:expenze_manager/screens/addingpage.dart/adding.dart';
import 'package:expenze_manager/screens/budgetpage/budget.dart';
import 'package:expenze_manager/screens/homepage/homepage.dart';
import 'package:expenze_manager/screens/profilepage/profile.dart';
import 'package:expenze_manager/screens/transactionpage/transaction.dart';
import 'package:expenze_manager/service/expenz_service.dart';
import 'package:expenze_manager/service/income_service.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Expenzes>? expenzList = [];
  List<Incomes>? incomeList = [];
  //fetch expenzes data
  void fetchExpenzes() async {
    List<Expenzes>? loadedExpenzes = await ExpenzeService().loadExpenzes();
    setState(() {
      expenzList = loadedExpenzes;
    });
  }

  //fetch income data
  void fetchIncome() async {
    List<Incomes>? loadedIncomes = await IncomeService().loadIncome();
    setState(() {
      incomeList = loadedIncomes;
    });
  }

  //add new expenz
  void addnewExpenz(Expenzes newExpenz) {
    ExpenzeService().saveExpenz(newExpenz, context);
    setState(() {
      expenzList!.add(newExpenz);
    });
  }

  //add new income
  void addnewIncome(Incomes newIncome) {
    IncomeService().saveIncome(newIncome, context);

    setState(() {
      incomeList!.add(newIncome);
    });
  }

  @override
  void initState() {
    setState(() {
      fetchExpenzes();
      fetchIncome();
    });

    // TODO: implement initState
    super.initState();
  }

  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomePage(),
      TransactionPage(
        expenzList: expenzList,
        IncomeList: incomeList,
      ),
      const AddingPage(),
      const BudgetPage(),
      const ProfilePage()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 13,
        elevation: 3,
        enableFeedback: true,
        selectedIconTheme: IconThemeData(color: kcButtonBlue, shadows: [
          BoxShadow(blurRadius: 3, color: kcHedingBlack.withOpacity(.1))
        ]),
        unselectedIconTheme: IconThemeData(color: kcDiscription, shadows: [
          Shadow(blurRadius: 3, color: kcHedingBlack.withOpacity(.1)),
        ]),
        items: _items,
        currentIndex: _selectIndex,
        onTap: (value) {
          setState(() {
            //SharedPreferences pref = await SharedPreferences.getInstance();

            _selectIndex = value;
            //await pref.setInt("pagenumber", _selectIndex);
          });
        },
      ),
      body: screens[_selectIndex],
    );
  }

  Future<void> setpage(BuildContext context, int currentpage) async {
    try {
      //initilize shared preferences
      SharedPreferences pref = await SharedPreferences.getInstance();
      //set the store data
      await pref.setInt("pagenumber", currentpage);
    } catch (err) {
      print("no way");
    }
  }

  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: 25,
      ),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.transform,
        size: 25,
      ),
      label: "Transaction",
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(100),
          shape: BoxShape.circle,
          color: kcButtonBlue,
        ),
        child: Icon(
          Icons.add,
          size: 25,
          fill: 0.5,
          color: kcButtonText,
        ),
      ),
      label: "",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.pie_chart,
        size: 25,
      ),
      label: "Budget",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
        size: 25,
      ),
      label: "Profile",
    ),
  ];
}
