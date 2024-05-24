import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';

class OnboardotherPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String discription;
  const OnboardotherPage(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.discription});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          scale: 3,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: TextStyle(
              color: kcHedingBlack,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              height: 1.2),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          discription,
          style: TextStyle(
              color: kcDiscription,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.2),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
