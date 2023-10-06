import 'dart:io';

import 'package:flutter/material.dart';

Future<double> getImageFileSizeInMB(String filePath) async {
  try {
    final file = File(filePath);
    final length = await file.length();
    final fileSizeInBytes = length.toDouble();
    final fileSizeInMB = fileSizeInBytes / (1024 * 1024); // Convert to MB
    return fileSizeInMB;
  } catch (e) {
    print('Error getting image file size: $e');
    return 0.0; // Return 0.0 if there is an error
  }
}

void navigateTo(Widget widget, BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
