import 'dart:convert';

import 'package:expenze_manager/model/expenzmodel.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenzeService {
  //expenz data list
  List<Expenzes> expenList = [];
//define the key for store the xepenzesin sharedpreferences
  static const String expenzKey = "expenzes";

  //save the expenz in shared preferences
  Future<void> saveExpenz(Expenzes expenz, BuildContext context) async {
    try {
      //create instance
      final SharedPreferences pref = await SharedPreferences.getInstance();
      //get existng expenzes
      List<String>? existingExpenzes = pref.getStringList(expenzKey);
      //convert encoded strings to expenze object and added to the list
      if (existingExpenzes != null) {
        expenList = existingExpenzes
            .map((e) => Expenzes.fromJSON(json.decode(e)))
            .toList();
        print("not null");
      }
      expenList.add(expenz);
      //expenz list to decoded string list
      List<String> updatedExpenzesList =
          expenList.map((e) => json.encode(e.toJSON())).toList();
      //store in shared preferences
      pref.setStringList(expenzKey, updatedExpenzesList);
      //show massage
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 3000),
            backgroundColor: kcButtonBlue,
            content: Text(
              "Expenze is added succsessfuly",
              style: TextStyle(color: kcButtonText),
            ),
          ),
        );
      }

      //if any error
    } catch (err) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 3000),
            backgroundColor: kcCardRed,
            content: Text(
              "something went wrong",
              style: TextStyle(color: kcButtonText),
            ),
          ),
        );
      }
    }
  }

  //load the current expenzes
  Future<List<Expenzes>>? loadExpenzes() async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? existingExpenzes = pref.getStringList(expenzKey);
      //convert encoded strings to expenze object and added to the list
      if (existingExpenzes != null) {
        expenList = existingExpenzes
            .map((e) => Expenzes.fromJSON(json.decode(e)))
            .toList();
      }
      return expenList;
    } catch (err) {
      return [];
    }
  }
}
