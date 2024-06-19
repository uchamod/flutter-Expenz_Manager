import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';

class CategoryprogressIndicator extends StatefulWidget {
  final String category;
  final double amount;
  final double total;
  final Color categoryColor;
  const CategoryprogressIndicator(
      {super.key,
      required this.category,
      required this.amount,
      required this.total,
      required this.categoryColor});

  @override
  State<CategoryprogressIndicator> createState() =>
      _CategoryprogressIndicatorState();
}

class _CategoryprogressIndicatorState extends State<CategoryprogressIndicator> {
  @override
  Widget build(BuildContext context) {
    double progressWidth = widget.amount / widget.total;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //show category
              Container(
                
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: kccardShadow),
                    boxShadow: [BoxShadow(color: kccardShadow.withOpacity(0.3), blurRadius: 1)]),
                padding: const EdgeInsets.all(7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //dot
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          color: widget.categoryColor,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    const SizedBox(width: 10,),
                    //category
                    // ignore: prefer_const_constructors
                    Text(widget.category,style: TextStyle(fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
              //amount
              Text("\$${widget.amount.toStringAsFixed(0)}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children:[
              Container(
                  width: double.infinity,
                  height: 15,
                  decoration: BoxDecoration(
                color: kcIndicatorbackground,
              
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(color: kccardShadow, blurRadius: 1),
                ],
              ),
              ), 
              Container(
              width: MediaQuery.of(context).size.width * progressWidth,
              height: 15,
              decoration: BoxDecoration(
                color: widget.categoryColor,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(color: kccardShadow, blurRadius: 1),
                ],
              ),
            ),]
          ),
        ],
      ),
    );
  }
}
