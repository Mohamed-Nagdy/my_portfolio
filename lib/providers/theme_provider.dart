import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../local_data_source/theme_local_data_source.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier({required ThemeLocalDataSource localDataSource})
      : super(localDataSource.themeMode());

  ThemeLocalDataSource localDataSource = ThemeLocalDataSource();

  ThemeMode getTheme() {
    return localDataSource.themeMode();
  }

  Future<void> changeTheme() async {
    if (state == ThemeMode.dark) {
      await localDataSource.saveIsDarkTheme(isDarkTheme: false);
      state = ThemeMode.light;
    } else {
      await localDataSource.saveIsDarkTheme(isDarkTheme: true);
      state = ThemeMode.dark;
    }
  }
}

final themeNotifier = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier(localDataSource: ThemeLocalDataSource());
});
