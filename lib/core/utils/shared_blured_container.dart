import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';

class SharedBluredContainer extends StatelessWidget {
  const SharedBluredContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
  });

  final Widget child;
  final EdgeInsets? padding;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      child: Container(
        padding:
            padding ??
            const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
        color: context.theme.colorScheme.primaryContainer,
        child: child,
      ),
    );
  }
}
