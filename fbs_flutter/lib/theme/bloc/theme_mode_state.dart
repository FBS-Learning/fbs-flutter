part of 'theme_mode_bloc.dart';

class ThemeModeState extends Equatable {
  const ThemeModeState(
      {this.themeMode = ThemeMode.light,
      this.darkMode = false,
      this.iconMode = 'assets/eva_icons/fill/svg/sun.svg',
      this.iconColor = Palette.lightColor});

  final ThemeMode themeMode;
  final bool darkMode;
  final String iconMode;
  final Color iconColor;

  ThemeModeState copyWith({
    ThemeMode? themeMode,
    bool? darkMode,
    String? iconMode,
    Color? iconColor,
  }) {
    return ThemeModeState(
      themeMode: themeMode ?? this.themeMode,
      darkMode: darkMode ?? this.darkMode,
      iconMode: iconMode ?? this.iconMode,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  List<ThemeMode> get props => [themeMode];
}
