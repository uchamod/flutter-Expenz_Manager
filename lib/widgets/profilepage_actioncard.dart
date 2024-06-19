import 'package:expenze_manager/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilepageActioncard extends StatefulWidget {
  final IconData icon;
  final String name;
  final Color color;
  final Color logoutcolor;
  const ProfilepageActioncard(
      {super.key,
      required this.icon,
      required this.name,
      required this.color,
      required this.logoutcolor});

  @override
  State<ProfilepageActioncard> createState() => _ProfilepageActioncardState();
}

class _ProfilepageActioncardState extends State<ProfilepageActioncard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kcButtonText,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: kccardShadow, offset: const Offset(1, 1), blurRadius: 2)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: widget.logoutcolor,
                boxShadow: [
                  BoxShadow(
                    color: kccardShadow,
                    offset: const Offset(1, 1),
                  ),
                ]),
            child: Center(
              child: Icon(
                widget.icon,
                size: 32,
                color: widget.color,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            widget.name,
            style: TextStyle(
                color: kcHedingBlack,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
