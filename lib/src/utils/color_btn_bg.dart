import 'package:flutter/material.dart';
import 'package:mini_campus_core/mc_packages/mc_core_constants/lib/src/index.dart';

/// determine toggle button color  based on theme
Color colorBtnBg(bool isDarkModeBtn, ThemeMode themeMode) {
  if (isDarkModeBtn) {
    if (themeMode == ThemeMode.light) {
      return Colors.transparent;
    }

    return McAppColors.appDarkModeTextFaintColor;
  } else {
    if (themeMode == ThemeMode.dark) {
      return Colors.transparent;
    }

    return McAppColors.appWhiteColor;
  }
}
