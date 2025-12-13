import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/login_tab.dart';
import '../widgets/register_tab.dart';
import 'package:Ecommerce/core/cubit/app_cubit.dart';

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
              context.read<AppCubit>().updateUser(state.user);
              Navigator.of(context).pushReplacementNamed(AppRoutes.navBar);
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 12,
                      ),
                      child: Column(
                        children: [
                          // Theme and Language Switcher
                          //  ThemeAndLangWidget(),
                          SizedBox(height: 16),
                          TabBar(
                            isScrollable: true,
                            tabAlignment: TabAlignment.start,
                            indicatorColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            dividerColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary.withAlpha(120),
                            labelStyle: Theme.of(context).textTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.w600),
                            tabs: [
                              Tab(text: context.l10n.signIn),
                              Tab(text: context.l10n.signUp),
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
              ),
            );
          },
        );
      },
    );
  }
}
