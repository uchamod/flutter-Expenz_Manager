import 'package:expenze_manager/screens/onboard_screens.dart';
import 'package:expenze_manager/screens/onboardfrontpage/front_page.dart';

import 'package:expenze_manager/widgets/mainpage.dart';

import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  final bool isUserNameHas;
  const Wrapper({super.key, required this.isUserNameHas});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.isUserNameHas ? const MainPage() : const OnBoardScreen();
  }
}
