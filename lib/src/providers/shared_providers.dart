import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_campus_core/mini_campus_core.dart';

final themeNotifierProvider = StateProvider<ValueNotifier<ThemeMode>>((ref) {
  final pref = ref.watch(sharedPreferencesServiceProvider);

  bool? isLightMode = pref.getCurrentUserTheme();

  if (isLightMode == null) {
    return ValueNotifier(ThemeMode.system);
  }

  if (isLightMode) {
    return ValueNotifier(ThemeMode.light);
  } else {
    return ValueNotifier(ThemeMode.dark);
  }
});

/// dio instance provider
final dioProvider = StateProvider<Dio>((ref) => dioInstance(null));

/// general app user
final fbAppUserProvider = StateProvider<AppFbUser?>((ref) => null);

/// currently logged in student
final studentProvider = StateProvider<Student?>((ref) => null);

/// currently logged in student Uni
/// FIXME: Pass dynamically
final studentUniProvider = StateProvider<Uni>((ref) => Uni.NUST);

final flavorConfigProvider = StateProvider<Map>((_) => {});

Dio dioInstance(String? authKey, {bool isJsonHeader = true}) {
  return Dio(
    BaseOptions(
      baseUrl: 'baseUrl', // ! add proper base url
      connectTimeout: 60000,
      receiveTimeout: 50000,
      sendTimeout: 60000,
      headers: authKey == null
          ? {
              'Content-Type': isJsonHeader
                  ? 'application/json'
                  : 'application/x-www-form-urlencoded',
            }
          : {
              "Authorization": 'Bearer $authKey',
              'Content-Type': isJsonHeader
                  ? 'application/json'
                  : 'application/x-www-form-urlencoded',
            },
    ),
  );
}
