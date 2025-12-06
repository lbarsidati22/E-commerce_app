part of 'app_cubit.dart';

class AppState {
  final ThemeMode themeMode;
  final Locale locale;

  const AppState({required this.themeMode, required this.locale});

  factory AppState.initial() {
    return const AppState(
      themeMode: ThemeMode.system, // Default to system
      locale: Locale('en'), // Default to English
    );
  }

  AppState copyWith({ThemeMode? themeMode, Locale? locale}) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}
