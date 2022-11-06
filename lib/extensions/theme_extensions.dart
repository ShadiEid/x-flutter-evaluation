import 'package:flutter/material.dart';
import '../storage/storage.dart';
import '../ui/resources/themes/themes.dart';
import '../ui/resources/themes/themes_night.dart';

extension ThemeUtils on ThemeData {
  Color? get textColor => this.textTheme.bodyText1?.color;

  bool isDark() => AppStorage.themeMode() == ThemeMode.dark;
}

extension ThemeModelUtils on ThemeMode {
  ThemeData get theme => this == ThemeMode.dark ? darkTheme : lightTheme;
}
