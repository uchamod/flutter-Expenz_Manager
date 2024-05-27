import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/material.dart';

class UserDetailFormFiled extends StatefulWidget {
  final String hintText;
  final String errorMassage;
  final TextEditingController textController;

  // ignore: prefer_typing_uninitialized_variables
  final inputType;
  // ignore: prefer_typing_uninitialized_variables
  final inputAction;
  // ignore: prefer_typing_uninitialized_variables
  final icon;

  final String? Function(String?) isvaild;
  //visibility checkers
  final bool showText;
  final bool Function()? isVisible;
  final conditionWidget;
  const UserDetailFormFiled({
    super.key,
    required this.hintText,
    required this.errorMassage,
    required this.textController,
    required this.showText,
    this.inputType,
    this.inputAction,
    required this.isvaild,
    this.icon,
    this.isVisible,
    this.conditionWidget,
  });

  @override
  State<UserDetailFormFiled> createState() => _UserDetailFormFiledState();
}

class _UserDetailFormFiledState extends State<UserDetailFormFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType,
      textInputAction: widget.inputAction,
      obscureText: widget.showText,
      controller: widget.textController,

      //add validate function
      validator: widget.isvaild,
      //input feild decoration
      decoration: InputDecoration(
        suffixIcon: widget.conditionWidget,

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
      ),
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}
