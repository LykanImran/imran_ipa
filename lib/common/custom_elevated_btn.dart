import 'package:flutter/material.dart';
import 'package:imran_ipa/utils/app_assets.dart';
import 'package:imran_ipa/utils/style_sheet.dart';

class CustomElevatedBtn extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final VoidCallback onPressed;

  const CustomElevatedBtn({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0), // Rounded corners
      onTap: onPressed,
      child: Container(
        height: 65,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        // height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
            color: buttonColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: StarIcon(
                size: 25,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: hexToColor("#147BFF"), // Same color text
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Transform.rotate(
                angle: 3.14159265, // 180 degrees in radians
                child: StarIcon(
                  size: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StarIcon extends StatelessWidget {
  double size;
  StarIcon({super.key, this.size = 25});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      starImg,
      width: size,
      height: size,
    );
  }
}
