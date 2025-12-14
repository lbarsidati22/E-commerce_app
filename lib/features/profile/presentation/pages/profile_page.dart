import 'package:Ecommerce/core/cubit/app_cubit.dart';
import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/core/keys/shared_key.dart';
import 'package:Ecommerce/core/modules/shared_preferences_module.dart';
import 'package:Ecommerce/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final user = state.user;
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final themeColor = Theme.of(context).primaryColor;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                backgroundColor: themeColor,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,

                        colors: [themeColor.withOpacity(0.8), themeColor],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            child: Text(
                              user?.name?.substring(0, 1).toUpperCase() ?? "G",
                              style: Theme.of(context).textTheme.headlineLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.colorScheme.onSecondary,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            user?.name ?? context.l10n.guestUser,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(user?.email ?? context.l10n.noEmail),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader(context, context.l10n.settings),
                      const SizedBox(height: 10),
                      _buildSettingCard(
                        context,
                        children: [
                          _buildSwitchTile(
                            context,
                            title: context.l10n.darkMode,
                            icon: isDark ? Icons.dark_mode : Icons.light_mode,
                            value: state.themeMode == ThemeMode.dark,
                            onChanged: (value) {
                              context.read<AppCubit>().changeTheme(
                                value ? ThemeMode.dark : ThemeMode.light,
                              );
                            },
                          ),
                          const Divider(height: 1),
                          _buildLanguageTile(context, state),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildSectionHeader(context, context.l10n.account),
                      const SizedBox(height: 10),
                      _buildSettingCard(
                        context,
                        children: [
                          _buildActionTile(
                            context,
                            title: context.l10n.editProfile,
                            icon: Icons.edit,
                            onTap: () {},
                          ),
                          const Divider(height: 1),
                          _buildActionTile(
                            context,
                            title: context.l10n.logout,
                            icon: Icons.logout,
                            color: Colors.red,
                            onTap: () {
                              _showLogoutDialog(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildSettingCard(
    BuildContext context, {
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: context.colorScheme.secondary),
      ),
      title: Text(
        title,
        style: context.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      value: value,
      onChanged: onChanged,
      activeThumbColor: context.colorScheme.secondary,
    );
  }

  Widget _buildLanguageTile(BuildContext context, AppState state) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.language, color: context.colorScheme.secondary),
      ),
      title: Text(
        context.l10n.language,
        style: context.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: state.locale.languageCode,
          icon: const Icon(Icons.arrow_forward_ios, size: 16),
          items: [
            DropdownMenuItem(
              value: 'en',
              child: Text(
                context.l10n.english,
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.secondary,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'ar',
              child: Text(
                context.l10n.arabic,
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.secondary,
                ),
              ),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              context.read<AppCubit>().changeLanguage(value);
            }
          },
        ),
      ),
    );
  }

  Widget _buildActionTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (color ?? Theme.of(context).primaryColor).withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color ?? context.colorScheme.secondary),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, color: color),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: context.colorScheme.primaryContainer,
          title: Text(context.l10n.logout),
          content: Text(context.l10n.areYouSureYouWantToLogOut),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                context.l10n.cancel,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.secondary,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                SharedPrefHelper().removePreference(
                  key: SharedPrefKeys.tokenKey,
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.authPage,
                  (route) => false,
                );
              },
              child: Text(
                context.l10n.confirmLogout,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
