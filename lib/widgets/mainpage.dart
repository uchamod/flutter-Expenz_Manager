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

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Expenzes>? expenzList = [];
  List<Incomes>? incomeList = [];
  dynamic total;
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

  //delete expenz
  void deleteExpenz(Expenzes expenz) async {
    ExpenzeService().deleteExpenz(expenz.id!, context);
    List<Expenzes>? loadedExpenzes = await ExpenzeService().loadExpenzes();
    setState(() {
      expenzList = loadedExpenzes;
    });
  }

  //delete income
  void deleteIncome(Incomes income) async {
    IncomeService().deleteIncome(income.id, context);
    List<Incomes>? loadedIncomes = await IncomeService().loadIncome();
    setState(() {
      incomeList = loadedIncomes;
    });
  }

  //get expenz  category total map
  Map<ExpenzCategory, double> calExpenz() {
    Map<ExpenzCategory, double> expenzMap = {
      ExpenzCategory.food: 0,
      ExpenzCategory.entertainment: 0,
      ExpenzCategory.helth: 0,
      ExpenzCategory.vechical: 0,
    };
    //calculate totl amounts by category
    for (Expenzes expenz in expenzList!) {
      expenzMap[expenz.catrgory] = expenzMap[expenz.catrgory]! + expenz.amount;
    }
    return expenzMap;
  }

  double expenzamount = 0;
  //get income category total map
  Map<incomeCategory, double> calIncome() {
    Map<incomeCategory, double> incomeMap = {
      incomeCategory.freelance: 0,
      incomeCategory.passive: 0,
      incomeCategory.salary: 0,
      incomeCategory.sales: 0,
    };
    //calculate total  amounts by category
    for (Incomes income in incomeList!) {
      incomeMap[income.catrgory] = incomeMap[income.catrgory]! + income.amount;
      expenzamount += income.amount;
    }
    return incomeMap;
  }

  //final Map<incomeCategory, double> incomeMap;

  int _selectIndex = 0;

  @override
  void initState() {
    setState(() {
      fetchExpenzes();
      fetchIncome();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomePage(
        expenzList: expenzList,
        incomeList: incomeList,
      ),
      TransactionPage(
        expenzList: expenzList,
        incomeList: incomeList,
        deleteExpenz: deleteExpenz,
        deleteIncome: deleteIncome,
      ),
      AddingPage(
        expenz: addnewExpenz,
        income: addnewIncome,
      ),
      BudgetPage(
        expenzMap: calExpenz(),
        incomeMap: calIncome(),
       
      ),
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

  // Future<void> setpage(BuildContext context, int currentpage) async {
  //   try {
  //     //initilize shared preferences
  //     SharedPreferences pref = await SharedPreferences.getInstance();
  //     //set the store data
  //     await pref.setInt("pagenumber", currentpage);
  //   } catch (err) {
  //     print("no way");
  //   }
  // }

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
