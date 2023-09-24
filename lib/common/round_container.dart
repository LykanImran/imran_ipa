import 'package:flutter/material.dart';
import 'package:imran_ipa/utils/style_sheet.dart';

class RoundContainer extends StatelessWidget {
  Widget child;
  Color color;
  RoundContainer(
      {super.key, required this.child, this.color = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 150.0,
      // height: 150.0,
      decoration: BoxDecoration(
        color: color, // You can change the background color here
        borderRadius: BorderRadius.circular(
            75.0), // Half of width/height for a round shape
        border: Border.all(
          color: hexToColor("#D9D8D8"),
          width: 2.0, // Border width
        ),
      ),
      child: child,
    );
  }
}
