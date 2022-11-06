import 'package:flutter/material.dart';

enum AppLocalization { en, ar }

class LocalizationEvent {
  const LocalizationEvent();
}

extension LanguageExtension on AppLocalization {
  Locale get getLocale {
    switch (this) {
      case AppLocalization.ar:
        return Locale("ar", "SA");

      case AppLocalization.en:
        return Locale("en", "US");
    }
  }
}

extension LanguageUtils on String {
  AppLocalization get getAppLocalization {
    switch (this) {
      case "ar":
        return AppLocalization.ar;

      default:
        return AppLocalization.en;
    }
  }
}
