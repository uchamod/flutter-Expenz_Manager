import 'package:flutter/material.dart';

// ignore: camel_case_types
enum incomeCategory { salary, passive, freelance, sales }

Map<incomeCategory, Icon> incomeCategoryImages = {
  incomeCategory.salary:const Icon(Icons.attach_money_rounded,color: Colors.green,size: 35,),
  incomeCategory.passive: const Icon(Icons.work_history_sharp,color: Colors.red,size: 35,),
  incomeCategory.freelance: const Icon(Icons.design_services,color: Colors.blue,size: 35,),
  incomeCategory.sales:const Icon(Icons.sell_outlined,color: Colors.orange,size: 35,)
};
Map<incomeCategory, Color> incomeColors = {
  incomeCategory.salary: const Color(0xff5FD068),
  incomeCategory.passive: const Color(0xffCC704B),
  incomeCategory.freelance: const Color(0xff8FBDD3),
  incomeCategory.sales: const Color(0xffF8C4B4)
};

class Incomes {
  final int id;
  final incomeCategory catrgory;
  final String title;
  final String discription;
  final dynamic amount;
  final String date;
  final String time;

  Incomes(
      {required this.id,
      required this.catrgory,
      required this.title,
      required this.discription,
      required this.amount,
      required this.date,
      required this.time});

 //serilization dart objct ot json object
 Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "category": catrgory.index,
      "title": title,
      "discription": discription,
      "amount": amount,
      'date': date,
      'time': time,
    };
  }

//deserelization json object to dart object
  factory Incomes.fromJSON(Map<String, dynamic> json) {
    return Incomes(
        id: json["id"],
        catrgory: incomeCategory.values[json["category"]],
        title: json["title"],
        discription: json["discription"],
        amount: json["amount"],
         date: json["date"],
      time:json["time"],
        );
  }
}
