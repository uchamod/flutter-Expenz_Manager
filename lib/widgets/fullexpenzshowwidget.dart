import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';

class FullExpenzShowCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final Color color;
  final double amount;
  const FullExpenzShowCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.color, required this.amount});

  @override
  State<FullExpenzShowCard> createState() => _FullExpenzShowCardState();
}

class _FullExpenzShowCardState extends State<FullExpenzShowCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: widget.color),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kcButtonText),
                child: Icon(
                  widget.icon,
                  size: 35,
                  color: widget.color,
                )),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      color: kcButtonText,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                 "\$${widget.amount.toStringAsFixed(0)}",
                  style: TextStyle(
                      color: kcButtonText,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
