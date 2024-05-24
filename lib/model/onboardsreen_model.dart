import 'package:flutter/material.dart';

//creata model for the onboard data
class OnboardScreenmodel {
  final String imagePath;
  final String title;
  final String diacription;

  OnboardScreenmodel(
      {required this.imagePath,
      required this.title,
      required this.diacription});
}
