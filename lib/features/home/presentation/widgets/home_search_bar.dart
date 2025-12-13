import 'package:Ecommerce/core/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Text('Hello !', style: Theme.of(context).textTheme.headlineLarge),
            Text(
              ' ${context.read<AppCubit>().state.user!.name}',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Spacer(),
        // switch theme
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.secondary.withAlpha(70),
          ),
          child: IconButton(
            icon: Icon(
              context.read<AppCubit>().state.themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 25,
            ),
            onPressed: () {
              final cubit = context.read<AppCubit>();
              final isDark = cubit.state.themeMode == ThemeMode.dark;
              cubit.changeTheme(isDark ? ThemeMode.light : ThemeMode.dark);
            },
          ),
        ),
      ],
    );
  }
}
