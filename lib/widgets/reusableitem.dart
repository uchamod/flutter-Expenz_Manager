import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';
//expenz or income card
class ReusableItem extends StatefulWidget {
  final Color color;

  final String title;
  final String discription;
  final String amount;
  final String time;
  final String image;
  const ReusableItem(
      {super.key,
      required this.color,
      required this.title,
      required this.discription,
      required this.amount,
      required this.time,
      required this.image});

  @override
  State<ReusableItem> createState() => _ReusableItemState();
}

class _ReusableItemState extends State<ReusableItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(10),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kcButtonText,
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                color: kcDiscription,
                offset: const Offset(1, 1),
                spreadRadius: 1,
              ),
            ]),

        //add the main row
        child: Row(
          children: [
            //first widget
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.color.withOpacity(0.3)),
              child: Image.asset(
                widget.image,
                scale: 30,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            //second widget
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kcHedingBlack),
                      ),
                      Text(widget.discription,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kcDiscription))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(widget.amount,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kcCardRed)),
                      Text(
                        widget.time,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: kcDiscription),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
