import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final String hintText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final String? labelText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool initialObscureText;
  final TextInputType? keyboardType;
  final Widget? prefIcon;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.labelStyle,
    this.labelText,
    required this.isPassword,
    required this.hintText,
    this.initialObscureText = true,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.keyboardType,
    this.prefIcon,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool isObscureText;

  @override
  void initState() {
    super.initState();
    isObscureText = widget.initialObscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: "★",
      controller: widget.controller,
      cursorColor: context.colorScheme.secondary,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: widget.prefIcon,
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle:
            widget.hintStyle ??
            AppStyles.regular16(context).copyWith(color: Colors.grey),
        isDense: true,
        contentPadding:
            widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        filled: true,
        fillColor:
            widget.backgroundColor ?? context.colorScheme.primaryContainer,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.colorScheme.onSecondary.withAlpha(110),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: context.colorScheme.secondary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                icon: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            : widget.suffixIcon,
      ),
      obscureText: widget.isPassword ? isObscureText : false,
      style: AppStyles.regular16(context),
      validator: widget.validator,
    );
  }
}
