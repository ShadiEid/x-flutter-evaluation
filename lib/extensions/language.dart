import 'package:flutter/material.dart';

enum Language {
  AR,
  EN,
}

extension LanguageExtension on Language {
  Locale get xGetLocale {
    switch (this) {
      case Language.AR:
        return Locale("ar", "SA");

      case Language.EN:
        return Locale("en", "US");
    }
  }
}
