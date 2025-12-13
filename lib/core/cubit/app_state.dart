part of 'app_cubit.dart';

class AppState {
  final ThemeMode themeMode;
  final Locale locale;
  final AuthEntity? user;

  const AppState({required this.themeMode, required this.locale, this.user});

  factory AppState.initial() {
    return const AppState(
      themeMode: ThemeMode.system, // Default to system
      locale: Locale('en'), // Default to English
    );
  }

  AppState copyWith({ThemeMode? themeMode, Locale? locale, AuthEntity? user}) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      user: user ?? this.user,
    );
  }
}
