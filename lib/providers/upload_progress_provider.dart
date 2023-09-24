
import 'package:flutter/material.dart';

class UploadProgressProvider extends ChangeNotifier {
  double _progress = 0.0;

  double get progress => _progress;

  void updateProgress(double newProgress) {
    _progress = newProgress;
    notifyListeners();
  }
}
