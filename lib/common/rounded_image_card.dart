import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:imran_ipa/utils/constants.dart';

class RoundedImageCard extends StatelessWidget {
  final String imagePath;
  bool isNetworkImage;

  RoundedImageCard(
      {super.key, required this.imagePath, this.isNetworkImage = false});

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
        child: isNetworkImage
            ? CachedNetworkImage(imageUrl: imgLink, fit: BoxFit.cover)
            : Image.file(File(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
