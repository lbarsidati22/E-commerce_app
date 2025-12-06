import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubit/app_cubit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.firstName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                return Text(
                  '${context.l10n.welcomBack} ${state.locale.languageCode}',
                  style: Theme.of(context).textTheme.bodyMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'theme_btn',
            onPressed: () {
              final cubit = context.read<AppCubit>();
              final isDark = cubit.state.themeMode == ThemeMode.dark;
              cubit.changeTheme(isDark ? ThemeMode.light : ThemeMode.dark);
            },
            child: const Icon(Icons.brightness_6),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'lang_btn',
            onPressed: () {
              final cubit = context.read<AppCubit>();
              final isArabic = cubit.state.locale.languageCode == 'ar';
              cubit.changeLanguage(isArabic ? 'en' : 'ar');
            },
            child: const Icon(Icons.language),
          ),
        ],
      ),
    );
  }
}
