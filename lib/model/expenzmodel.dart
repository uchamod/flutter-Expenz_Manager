import 'package:flutter/material.dart';

// ignore: camel_case_types
enum ExpenzCategory { food, helth, vechical, entertainment }

Map<ExpenzCategory, Icon> expenzCategoryImages = {
  ExpenzCategory.food: const Icon(Icons.food_bank_outlined,color: Colors.green,size: 35,),
  ExpenzCategory.helth: const Icon(Icons.health_and_safety_outlined,color: Colors.red,size: 35,),
  ExpenzCategory.vechical: const Icon(Icons.car_rental_outlined,color: Colors.blue,size: 35,),
  ExpenzCategory.entertainment:const Icon(Icons.music_note_outlined,color: Colors.orange,size: 35,)
};
Map<ExpenzCategory, Color> expenzColors = {
  ExpenzCategory.food: const Color(0xff5FD068),
  ExpenzCategory.helth: const Color(0xffCC704B),
  ExpenzCategory.vechical: const Color(0xff8FBDD3),
  ExpenzCategory.entertainment: const Color(0xffF8C4B4)
};

// ignore: camel_case_types
class Expenzes {
  final int? id;
  final ExpenzCategory catrgory;
  final String title;
  final String discription;
  final String amount;
  final String date;
  final String time;

  Expenzes(
      {required this.id,
      required this.catrgory,
      required this.title,
      required this.discription,
      required this.amount,
      required this.date,
      required this.time});
  //serilization dart objet to jason object
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
  factory Expenzes.fromJSON(Map<String, dynamic> json) {
    return Expenzes(
      id: json["id"],
      catrgory: ExpenzCategory.values[json["category"]],
      title: json["title"],
      discription: json["discription"],
      amount: json["amount"],
      date: json["date"],
      time:json["time"],
    );
  }
}
