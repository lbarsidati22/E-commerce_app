import 'package:Ecommerce/core/cubit/app_cubit.dart';
import 'package:Ecommerce/core/keys/shared_key.dart';
import 'package:Ecommerce/core/modules/shared_preferences_module.dart';
import 'package:Ecommerce/core/route/app_routes.dart';
import 'package:Ecommerce/features/home/presentation/widgets/theme_and_lang_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final user = state.user;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue,
                        child: Text(
                          user?.name?.substring(0, 1).toUpperCase() ?? "G",
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        user?.name ?? "Guest User",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        user?.email ?? "No Email",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      ThemeAndLangWidget(),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("My Profile"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    // i want to see loeding indicator while logout process is going on
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(child: CircularProgressIndicator());
                      },
                    );
                    SharedPrefHelper().removePreference(
                      key: SharedPrefKeys.tokenKey,
                    );
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.authPage,
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
