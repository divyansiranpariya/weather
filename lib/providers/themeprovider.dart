import 'package:flutter/material.dart';
import 'package:weather_app/models/theme_modek.dart';

class Themeprovider extends ChangeNotifier {
  ThemeModel themeModel = ThemeModel(isTap: false);

  void chandge() {
    themeModel.isTap = !themeModel.isTap;
    notifyListeners();
  }
}
