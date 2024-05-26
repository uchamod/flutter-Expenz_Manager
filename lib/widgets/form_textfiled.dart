import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';

class UserDetailFormFiled extends StatefulWidget {
  final String hintText;
  final String errorMassage;
  final TextEditingController textController;
  final bool showText;
  const UserDetailFormFiled(
      {super.key,
      required this.hintText,
      required this.errorMassage,
      required this.textController,
      required this.showText});

  @override
  State<UserDetailFormFiled> createState() => _UserDetailFormFiledState();
}

class _UserDetailFormFiledState extends State<UserDetailFormFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.showText,
      controller: widget.textController,
      validator: (value) {
        if (value!.isEmpty) {
          return widget.errorMassage;
        }
      },
      //input feild decoration
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        //disable underline border
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: kcTextFiledBorder),
        ),
        //active border decoration
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: kcTextFiledBorder, width: 2),
        ),
        //focus border decoration
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: kcTextFiledBorder),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red.shade300),
        ),
      ),
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}
