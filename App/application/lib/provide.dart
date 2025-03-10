import 'dart:math';

import 'package:application/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Theme_Manager with ChangeNotifier {
  final _box = Hive.box("Theme");

  ThemeData _themeData = Light_Theme;

  ThemeData get themeData => _themeData;

  Theme_Manager() {
    LoadTheme();
  }

  void ChangeTheme(bool isDark) async {
    _themeData = isDark ? Dark_Theme : Light_Theme;
    notifyListeners();

    await _box.put("CurrentTheme", isDark);
  }

  void LoadTheme() async {
    bool isDark = _box.get("CurrentTheme");
    _themeData = isDark ? Dark_Theme : Light_Theme;
  }
}

class Graphs extends ChangeNotifier {
  int index = -1;
  List<double> arr = [0, 0, 0, 0, 0, 0];

  void Change_Array(List<double> array) {
    double max = -double.infinity;
    for (int i = 0; i < 6; i++) {
      if (max < array[i]) {
        max = array[i];
        index = i;
      }
    }

    for (int i = 0; i < 6; i++) {
      array[i] = exp(array[i] - max);
    }
    arr = array;
    notifyListeners();
  }

  notifyListeners();
}
