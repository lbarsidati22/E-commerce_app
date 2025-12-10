import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/features/navBar/presentation/cubit/navbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(child: Text('Profile Page')),
          TextButton(
            onPressed: () {
              context.read<LayoutViewModel>().doIntent(
                LayoutChangeBottomNavIntent(1),
              );
            },
            child: Text('profile', style: context.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
