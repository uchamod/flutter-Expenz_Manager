import 'package:expenze_manager/model/expenzmodel.dart';
import 'package:expenze_manager/model/incomemodel.dart';

class DataWrapper {
  List<Incomes> incomeList = [
    Incomes(
        Id: 1,
        catrgory: incomeCategory.freelance,
        title: "freelance",
        discription: "discripiton",
        amount: "10",
        date: "2002",
        time: "10 am"),
    Incomes(
        Id: 1,
        catrgory: incomeCategory.freelance,
        title: "passive",
        discription: "discripiton",
        amount: "10",
        date: "2002",
        time: "10 am"),
  ];
  List<Expenzes> expenzList = [
    Expenzes(
        Id: 1,
        catrgory: ExpenzCategory.entertainment,
        title: "food",
        discription: "discripiton",
        amount: "10",
        date: "2002",
        time: "10 am"),
  ];
}
