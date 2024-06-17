import 'dart:convert';

import 'package:expenze_manager/model/incomemodel.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeService {
  //income key
  static const String _incomeKey = "incomes";
  //income list
  List<Incomes> incomeList = [];

//methos for save income
  Future<void> saveIncome(Incomes income, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? existingIncomeList = pref.getStringList(_incomeKey);
      if (existingIncomeList != null) {
        incomeList = existingIncomeList
            .map((e) => Incomes.fromJSON(jsonDecode(e)))
            .toList();
        print("not null");
      }
      //add to list
      incomeList.add(income);
      //convert to json encoded format
      List<String>? updatedIncomeList =
          incomeList.map((e) => jsonEncode(e.toJSON())).toList();
      //save in shared preferenes
      await pref.setStringList(_incomeKey, updatedIncomeList);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kcButtonBlue,
            content: Text(
              "income added succsussfuly",
              style: TextStyle(color: kcButtonText),
            ),
          ),
        );
      }
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

  //load a income from shared preferences
  Future<List<Incomes>?> loadIncome() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? existingIncomeList = pref.getStringList(_incomeKey);
      //get existing  income list
      if (existingIncomeList != null) {
        incomeList = existingIncomeList
            .map(
              (e) => Incomes.fromJSON(
                jsonDecode(e),
              ),
            )
            .toList();
      }

      return incomeList;
    } catch (err) {
      return [];
    }
  }

  //delete an Income
  Future<void> deleteExpenz(int id, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? existingExpenzes = pref.getStringList(_incomeKey);
      if (existingExpenzes != null) {
        incomeList = existingExpenzes
            .map((e) => Incomes.fromJSON(json.decode(e)))
            .toList();
        //remove the expenz
       incomeList.removeWhere((element) => element.id == id);
        //encode the expenz list to json and store it
        List<String> updatedExpenzList =
            incomeList.map((e) => json.encode(e.toJSON())).toList();
        pref.setStringList(_incomeKey, updatedExpenzList);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 3),
              backgroundColor: kcButtonBlue,
              content: Text(
                "Income deleted succsussfuly",
                style: TextStyle(color: kcButtonText),
              )));
        }
      }
    } catch (err) {
      if (context.mounted) {
        print(err);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 3),
            backgroundColor: kcCardRed,
            content: Text(
              "something went wrong",
              style: TextStyle(color: kcButtonText),
            )));
      }
    }
  }
}
