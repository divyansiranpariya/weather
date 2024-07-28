import 'package:flutter/material.dart';

class ConavertProvider extends ChangeNotifier {
  bool isconvert = true;

  void convertfel() {
    isconvert = true;
    notifyListeners();
  }

  void convertcel() {
    isconvert = false;
    notifyListeners();
  }
}
