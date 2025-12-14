import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';

class HomeSectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAllTap;

  const HomeSectionTitle({super.key, required this.title, this.onViewAllTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          InkWell(
            onTap: onViewAllTap,
            child: Text(
              context.l10n.view_all,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
