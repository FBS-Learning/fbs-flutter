import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_mode_event.dart';
part 'theme_mode_state.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  ThemeModeBloc() : super(const ThemeModeState()) {
    on<ThemeModeChanged>(_onThemeMode);
  }

  void _onThemeMode(ThemeModeEvent event, Emitter<ThemeModeState> emit) {
    if (state.themeMode == ThemeMode.light) {
      emit(const ThemeModeState(themeMode: ThemeMode.dark, darkMode: true));
    } else {
      emit(const ThemeModeState(themeMode: ThemeMode.light, darkMode: false));
    }
  }
}
