import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final String text;
  final bool isElevated;
  final Color color;
  final VoidCallback onPressed;

  const CustomRoundedButton({
    super.key,
    required this.text,
    this.isElevated = true,
    this.color = Colors.blue,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return isElevated
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              backgroundColor: color, // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Rounded corners
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),

              side: BorderSide(color: color), // Border color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Rounded corners
              ),
            ),
            child: Text(
              text,
              style: TextStyle(color: color), // Text color
            ),
          );
  }
}
