part of 'theme_mode_bloc.dart';

class ThemeModeState extends Equatable {
  const ThemeModeState(
      {this.themeMode = ThemeMode.light, this.darkMode = false});

  final ThemeMode themeMode;
  final bool darkMode;

  ThemeModeState copyWith({
    ThemeMode? themeMode,
    bool? darkMode,
  }) {
    return ThemeModeState(
      themeMode: themeMode ?? this.themeMode,
      darkMode: darkMode ?? this.darkMode,
    );
  }

  @override
  List<ThemeMode> get props => [themeMode];
}
