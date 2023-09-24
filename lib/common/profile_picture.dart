import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  String imagePath;
  String name;
  double size;

  ProfilePicture(
      {super.key, this.name = "", this.imagePath = "", this.size = 45});

  @override
  Widget build(BuildContext context) {
    return imagePath == ""
        ? CircleAvatar(
            backgroundColor: Colors.deepOrange,
            radius: size,
            child: const FittedBox(
              child: Center(
                child: Icon(Icons.person),
              ),
            ))
        : CircleAvatar(
            backgroundColor: Colors.deepOrange,

            /// IMAGE PART
            backgroundImage: CachedNetworkImageProvider(
              imagePath,
            ),
            radius: size,
          );
  }
}
