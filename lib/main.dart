import 'package:Ecommerce/core/di/di.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-commerce App',
            theme: AppTheme.lightTheme(context, state.locale.languageCode),
            darkTheme: AppTheme.darkTheme(context, state.locale.languageCode),
            themeMode: state.themeMode,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            onGenerateRoute: Routes.generateRoute,
            initialRoute: AppRoutes.authPage,
          );
        },
      ),
    );
  }
}
