import 'package:Ecommerce/core/cubit/app_cubit.dart';
import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeAndLangWidget extends StatelessWidget {
  const ThemeAndLangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            final cubit = context.read<AppCubit>();
            final isDark = cubit.state.themeMode == ThemeMode.dark;
            cubit.changeTheme(isDark ? ThemeMode.light : ThemeMode.dark);
          },
          child: Text(
            context.watch<AppCubit>().state.themeMode == ThemeMode.light
                ? 'Light Mode'
                : 'Dark Mode',
            style: context.textTheme.titleSmall,
          ),
        ),
        SizedBox(width: 16),
        DropdownButton<String>(
          dropdownColor: Theme.of(context).colorScheme.surface,
          value: context.watch<AppCubit>().state.locale.languageCode,
          style: Theme.of(context).textTheme.bodyMedium,
          onChanged: (value) {
            if (value != null) {
              context.read<AppCubit>().changeLanguage(value);
            }
          },
          items: AppLocalizations.supportedLocales.map((locale) {
            return DropdownMenuItem(
              value: locale.languageCode,
              child: Text(
                locale.languageCode == 'en' ? 'English' : 'Arabic',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
