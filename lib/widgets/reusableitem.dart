import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';

//expenz or income card
class ReusableItem extends StatefulWidget {
  final Color color;

  final String title;
  final String discription;
  final dynamic amount;
  final String time;
  final Icon image;
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
                color: kccardShadow,
                offset: const Offset(0, 1),
                spreadRadius: 0,
              ),
            ]),

        //add the main row
        child: Row(
          children: [
            //first widget
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.color.withOpacity(0.3)),
             
              child:widget.image,
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
                      //card title
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kcHedingBlack),
                      ),
                      //card discription
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
                      //card amount
                      Text(widget.amount.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kcCardRed)),
                      Text(
                        //card time
                        widget.time.toString(),
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
