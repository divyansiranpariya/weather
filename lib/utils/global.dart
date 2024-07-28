import 'dart:ui';

import 'package:flutter/material.dart';

class TodayWeather {
  static List<Map<String, dynamic>> allhours = [
    {'time': "09:00", 'cel': "22°"},
    {"time": "10:00", "cel": "20°"},
    {"time": "11:00", "cel": "23°"},
    {"time": "12:00", "cel": "21°"},
    {"time": "01:00", "cel": "22°"},
    {"time": "02:00", "cel": "19°"},
    {"time": "03:00", "cel": "23°"},
    {"time": "04:00", "cel": "22°"},
    {"time": "05:00", "cel": "20°"},
    {"time": "06:00", "cel": "24°"},
  ];
  static List<Map<String, dynamic>> days = [
    {'day': "Mon", 'cel': "22°"},
    {"day": "Tue", "cel": "20°"},
    {"day": "Wed", "cel": "23°"},
    {"day": "Thu", "cel": "21°"},
    {"day": "Fri", "cel": "22°"},
    {"day": "Sat", "cel": "19°"},
    {"day": "Sun", "cel": "23°"},
  ];

  static TextStyle title = TextStyle(color: Colors.white, fontSize: 20);
  static TextStyle subtitle = TextStyle(color: Colors.white, fontSize: 17);
}
