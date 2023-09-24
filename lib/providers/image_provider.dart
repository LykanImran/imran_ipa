import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum ImgStatus { Unintialized, ImageLoaded }

class ImgProvider with ChangeNotifier {
  final ImgStatus _status = ImgStatus.Unintialized;

  ImgStatus get imageStatus => _status;

  late XFile _image;
  XFile get image => _image;

  void setPickedImage(XFile img) {
    debugPrint("Prov: setting picked image  ---> ");
    _image = img;
    notifyListeners();
  }
}
