import 'package:Ecommerce/core/cubit/app_cubit.dart';
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
                backgroundColor: Colors.black,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 50,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        // make the user can change theme and thenge lang with app cubit
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
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 16),
                            DropdownButton<String>(
                              value: context
                                  .watch<AppCubit>()
                                  .state
                                  .locale
                                  .languageCode,
                              onChanged: (value) {
                                context.read<AppCubit>().changeLanguage(
                                  context
                                      .read<AppCubit>()
                                      .state
                                      .locale
                                      .languageCode,
                                );
                              },
                              items: AppLocalizations.supportedLocales
                                  .map<DropdownMenuItem<String>>((locale) {
                                    return DropdownMenuItem<String>(
                                      value: locale.languageCode,
                                      child: Text(locale.languageCode),
                                    );
                                  })
                                  .toList(),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          labelColor: Colors.white,
                          indicatorColor: Colors.blue,
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
