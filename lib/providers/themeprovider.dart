import 'package:flutter/material.dart';
import 'package:weather_app/models/theme_modek.dart';

class Themeprovider extends ChangeNotifier {
  ThemeModel themeModel = ThemeModel(isTap: false);

  void chandge(val) {
    themeModel.isTap = val;
    notifyListeners();
  }
}
