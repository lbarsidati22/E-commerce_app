import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Size? size;
  final Color? backgroundColorButton;
  final void Function()? onPressed;
  final Widget? child;
  final double? elevation;
  final BorderSide? borderSide;
  final double borderRadius;
  final bool isLoading;

  const CustomButton({
    super.key,
    this.size,
    this.elevation,
    this.borderSide,
    this.child,
    this.backgroundColorButton,
    this.borderRadius = 0,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: borderSide,
        backgroundColor: backgroundColorButton,
        minimumSize: size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(borderRadius),
        ),
        elevation: elevation,
      ),
      child: isLoading
          ? const CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            )
          : child,
    );
  }
}
