import 'package:bloc_app/extensions/theme_extensions.dart';
import 'package:bloc_app/storage/storage.dart';
import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData themeData;
  const ThemeState(this.themeData);
}

class InitialThemeState extends ThemeState {
  InitialThemeState() : super(AppStorage.themeMode().theme);
}
