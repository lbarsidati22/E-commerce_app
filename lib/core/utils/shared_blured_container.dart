import 'dart:ui';

import 'package:Ecommerce/core/theme/colors/colors_dark.dart';
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
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: AnimatedContainer(
          padding:
              padding ??
              const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
          color: ColorsDark.containerColor,
          duration: const Duration(milliseconds: 3000),
          child: child,
        ),
      ),
    );
  }
}
