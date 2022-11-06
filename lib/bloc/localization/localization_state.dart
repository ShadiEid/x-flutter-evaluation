import 'package:bloc_app/bloc/localization/localization_event.dart';
import 'package:bloc_app/storage/storage.dart';

class LocalizationState {
  final AppLocalization appLocalization;
  const LocalizationState(this.appLocalization);

  AppLocalization change() {
    if (appLocalization == AppLocalization.en) {
      return AppLocalization.ar;
    } else {
      return AppLocalization.en;
    }
  }
}

class InitialLocalizationState extends LocalizationState {
  InitialLocalizationState() : super(AppStorage.getLanguage().getAppLocalization);
}
