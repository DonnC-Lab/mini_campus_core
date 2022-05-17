import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../index.dart';

class LogoBox extends StatelessWidget {
  const LogoBox({
    Key? key,
    this.themeMode = ThemeMode.light,
    this.size = 140,
    this.logoDarkMode = 'assets/images/logo_dm.png',
    this.logoLightMode = 'assets/images/logo.png',
  }) : super(key: key);

  final String? logoLightMode;
  final String? logoDarkMode;

  final ThemeMode themeMode;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      return SizedBox(
        height: size,
        width: size,
        child: ref.watch(themeNotifierProvider).value == ThemeMode.light
            ? Image.asset(logoLightMode ?? 'assets/images/logo.png')
            : Image.asset(logoLightMode ?? 'assets/images/logo_dm.png'),
      );
    });
  }
}
