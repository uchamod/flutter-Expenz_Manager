import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';

//create shared button
class CoustomButton extends StatefulWidget {
  final String text;
  final Color buttonColor;
  const CoustomButton(
      {super.key, required this.text, required this.buttonColor});

  @override
  State<CoustomButton> createState() => _CoustomButtonState();
}

class _CoustomButtonState extends State<CoustomButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.063,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: widget.buttonColor),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                color: kcButtonText, fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
