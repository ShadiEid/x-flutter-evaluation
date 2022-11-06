import 'package:bloc_app/extensions/nullable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static SharedPreferences getPreferences() => GetIt.I.get<SharedPreferences>();

  static Future<void> setDarkTheme(bool darkTheme) async {
    await getPreferences().setBool('dark_theme', darkTheme);
  }

  static ThemeMode themeMode() {
    bool? darkMode = getPreferences().getBool('dark_theme');
    var mode = ThemeMode.light;
    darkMode?.let((it) => mode = it ? ThemeMode.dark : ThemeMode.light);
    return mode;
  }

  static Future<void> setFirstOpen({bool boolean = false}) async {
    await getPreferences().setBool('first_open', boolean);
  }

  static bool isFirstOpen() {
    final boolean = getPreferences().getBool("first_open");
    return boolean ?? true;
  }

  static Future<void> setLanguage(String language) async {
    await getPreferences().setString("language", language);
  }

  static String getLanguage() {
    return getPreferences().getString("language") ?? "en";
  }
}
