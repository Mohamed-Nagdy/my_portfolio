import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../constants.dart';

class ThemeLocalDataSource {
  final box = Hive.box(Constants.mainBox.name);

  // get is the saved theme is dark theme or not
  ThemeMode themeMode() {
    // Midnight Tech is dark-first; default to dark when nothing is saved.
    final isDarkTheme = box.get(Constants.themeKey.name) ?? true;

    return isDarkTheme == true ? ThemeMode.dark : ThemeMode.light;
  }

  // save if the theme is dark theme or not
  Future<void> saveIsDarkTheme({bool? isDarkTheme}) async =>
      await box.put(Constants.themeKey.name, isDarkTheme);
}
