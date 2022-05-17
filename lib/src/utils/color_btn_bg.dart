import 'package:flutter/material.dart';
import 'package:mc_core_constants/mc_core_constants.dart';

/// determine toggle button color  based on theme
Color colorBtnBg(bool isDarkModeBtn, ThemeMode themeMode) {
  if (isDarkModeBtn) {
    if (themeMode == ThemeMode.light) {
      return Colors.transparent;
    }

    return homePageTextFaint;
  } else {
    if (themeMode == ThemeMode.dark) {
      return Colors.transparent;
    }

    return mainWhite;
  }
}
