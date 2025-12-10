import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';

class TabBarItemWidget extends StatelessWidget {
  final int currentIndex;
  final int index;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const TabBarItemWidget({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: onTap,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 1.0, end: isSelected ? 1.2 : 1.0),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 25,
                  color: isSelected
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.grey.shade600,
                ),
                SizedBox(height: 4),
                if (isSelected)
                  Text(
                    label,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
