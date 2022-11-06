import 'package:bloc_app/storage/storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'localization_event.dart';
import 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(InitialLocalizationState()) {
    on<LocalizationEvent>(_localizationEvent);
  }

  void _localizationEvent(LocalizationEvent event, Emitter<LocalizationState> emit) async {
    final appLocale = state.change();
    await AppStorage.setLanguage(appLocale.name);
    emit(LocalizationState(appLocale));
  }
}
