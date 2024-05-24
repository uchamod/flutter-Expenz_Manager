import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "imageassets/coin_7106294.png",
          scale: 3,
        ),
        Text(
          "Expenz  Manager",
          style: TextStyle(
              color: kcButtonBlue, fontSize: 32, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
