import 'dart:io';

import 'package:flutter/material.dart';

class RoundedImageCard extends StatelessWidget {
  final String imagePath;

  const RoundedImageCard({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("file path in rounded Image $imagePath");
    BorderRadius borderRadius = BorderRadius.circular(12.0);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      elevation: 1.5, // You can adjust the elevation as needed
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.file(File(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
