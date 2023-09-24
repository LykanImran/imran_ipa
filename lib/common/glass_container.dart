import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  Widget child;
  double size;
  GlassContainer({super.key, required this.child, this.size = 5});

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
        elevation: 0,
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: SizedBox(
          height: size,
          width: size,
          child: Center(child: child),
        ));
  }
}
