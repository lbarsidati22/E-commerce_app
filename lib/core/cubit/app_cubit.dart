import 'package:Ecommerce/core/keys/shared_key.dart';
import 'package:Ecommerce/core/modules/shared_preferences_module.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  final SharedPrefHelper _sharedPrefHelper;

  AppCubit(this._sharedPrefHelper) : super(AppState.initial()) {
    _loadSettings();
  }

  void _loadSettings() {
    final savedTheme = _sharedPrefHelper.getString(
      key: SharedPrefKeys.themeModeKey,
    );
    final savedLang = _sharedPrefHelper.getString(
      key: SharedPrefKeys.languageKey,
    );

    ThemeMode themeMode = ThemeMode.system;
    if (savedTheme != null) {
      if (savedTheme == 'light') themeMode = ThemeMode.light;
      if (savedTheme == 'dark') themeMode = ThemeMode.dark;
    }

    Locale locale = const Locale('en');
    if (savedLang != null) {
      locale = Locale(savedLang);
    }

    emit(state.copyWith(themeMode: themeMode, locale: locale));
  }

  void changeTheme(ThemeMode themeMode) {
    _sharedPrefHelper.setString(
      key: SharedPrefKeys.themeModeKey,
      stringValue: themeMode == ThemeMode.light ? 'light' : 'dark',
    );
    emit(state.copyWith(themeMode: themeMode));
  }

  void changeLanguage(String languageCode) {
    _sharedPrefHelper.setString(
      key: SharedPrefKeys.languageKey,
      stringValue: languageCode,
    );
    emit(state.copyWith(locale: Locale(languageCode)));
  }
}
