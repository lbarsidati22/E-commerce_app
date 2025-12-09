import 'package:Ecommerce/core/cubit/app_cubit.dart';
import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/core/l10n/app_localizations.dart';
import 'package:Ecommerce/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/login_tab.dart';
import '../widgets/register_tab.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Successful!'),
                ),
              );
              Navigator.of(context).pushReplacementNamed(AppRoutes.home);
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.message),
                ),
              );
              print(state.message);
            }
          },
          builder: (context, state) {
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 50,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        // Theme and Language Switcher
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                final cubit = context.read<AppCubit>();
                                final isDark =
                                    cubit.state.themeMode == ThemeMode.dark;
                                cubit.changeTheme(
                                  isDark ? ThemeMode.light : ThemeMode.dark,
                                );
                              },
                              child: Text(
                                context.watch<AppCubit>().state.themeMode ==
                                        ThemeMode.light
                                    ? 'Light Mode'
                                    : 'Dark Mode',
                                style: context.textTheme.titleSmall,
                              ),
                            ),
                            SizedBox(width: 16),
                            DropdownButton<String>(
                              dropdownColor: Theme.of(
                                context,
                              ).colorScheme.surface,
                              value: context
                                  .watch<AppCubit>()
                                  .state
                                  .locale
                                  .languageCode,
                              style: Theme.of(context).textTheme.bodyMedium,
                              onChanged: (value) {
                                if (value != null) {
                                  context.read<AppCubit>().changeLanguage(
                                    value,
                                  );
                                }
                              },
                              items: AppLocalizations.supportedLocales.map((
                                locale,
                              ) {
                                return DropdownMenuItem(
                                  value: locale.languageCode,
                                  child: Text(
                                    locale.languageCode == 'en'
                                        ? 'English'
                                        : 'Arabic',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          indicatorColor: Colors.blue,
                          labelStyle: Theme.of(context).textTheme.titleSmall,
                          tabs: [
                            Tab(text: 'Login'),
                            Tab(text: 'Sign Up'),
                          ],
                        ),

                        Expanded(
                          child: TabBarView(
                            children: [LoginTab(), RegisterTab()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
