import 'package:bloc_app/storage/storage.dart';
import 'package:bloc_app/ui/resources/themes/themes.dart';
import 'package:bloc_app/ui/resources/themes/themes_night.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(InitialThemeState()) {
    on<ThemeEvent>(_themeEvent);
  }

  void _themeEvent(ThemeEvent themeEvent, Emitter<ThemeState> emit) async {
    await AppStorage.setDarkTheme(themeEvent.appTheme == AppTheme.darkTheme);
    emit(ThemeState(themeEvent.appTheme == AppTheme.darkTheme ? darkTheme : lightTheme));
  }
}
