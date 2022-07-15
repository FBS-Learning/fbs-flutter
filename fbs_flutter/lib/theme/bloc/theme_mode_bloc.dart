import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_mode_event.dart';
part 'theme_mode_state.dart';

class ThemeIcon {
  final String dark = 'assets/eva_icons/fill/svg/moon.svg';
  final String light = 'assets/eva_icons/fill/svg/sun.svg';
}

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  ThemeModeBloc() : super(const ThemeModeState()) {
    on<ThemeModeChanged>(_onThemeMode);
  }

  void _onThemeMode(ThemeModeEvent event, Emitter<ThemeModeState> emit) {
    if (state.themeMode == ThemeMode.light) {
      emit(ThemeModeState(
          themeMode: ThemeMode.dark,
          darkMode: true,
          iconMode: ThemeIcon().dark,
          iconColor: Palette.lightColor));
    } else {
      emit(ThemeModeState(
          themeMode: ThemeMode.light,
          darkMode: false,
          iconMode: ThemeIcon().light,
          iconColor: const Color(0xFFFFD700)));
    }
  }
}
