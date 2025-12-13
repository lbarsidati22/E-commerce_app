import 'dart:developer';

import 'package:Ecommerce/core/di/di.dart';
import 'package:Ecommerce/core/keys/shared_key.dart';
import 'package:Ecommerce/core/modules/shared_preferences_module.dart';
import 'package:Ecommerce/core/route/app_routes.dart';
import 'package:Ecommerce/core/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/l10n/app_localizations.dart';
import 'core/cubit/app_cubit.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await SharedPrefHelper().instantiatePreferences();
  final token = SharedPrefHelper().getString(key: SharedPrefKeys.tokenKey);
  log('token is $token');
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppCubit>(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-commerce App',
            theme: AppTheme.lightTheme(context, state.locale.languageCode),
            darkTheme: AppTheme.darkTheme(context, state.locale.languageCode),
            themeMode: ThemeMode.light,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            onGenerateRoute: Routes.generateRoute,
            initialRoute: (token != null && token!.isNotEmpty)
                ? AppRoutes.navBar
                : AppRoutes.authPage,
            // initialRoute: AppRoutes.authPage,
          );
        },
      ),
    );
  }
}
