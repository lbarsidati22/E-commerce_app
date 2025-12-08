import 'package:flutter/material.dart';
import 'colors/colors_dark.dart';
import 'colors/colors_light.dart';
import 'app_styles.dart';

abstract class AppTheme {
  static ThemeData getTheme({
    required BuildContext context,
    required ColorScheme colorScheme,
    required Color textFormFieldBorderColor,
    required String fontFamily,
  }) {
    return ThemeData(
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),

      inputDecorationTheme: InputDecorationTheme(
        fillColor: colorScheme.surface,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: textFormFieldBorderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: textFormFieldBorderColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
      ),

      textTheme: TextTheme(
        // Display
        displayLarge: AppStyles.bold57(
          context,
        ).copyWith(color: colorScheme.onSurface),
        displayMedium: AppStyles.medium45(
          context,
        ).copyWith(color: colorScheme.onSurface),
        displaySmall: AppStyles.regular36(
          context,
        ).copyWith(color: colorScheme.onSurface),

        // Headline
        headlineLarge: AppStyles.regular32(
          context,
        ).copyWith(color: colorScheme.onSurface),
        headlineMedium: AppStyles.regular28(
          context,
        ).copyWith(color: colorScheme.onSurface),
        headlineSmall: AppStyles.regular24(
          context,
        ).copyWith(color: colorScheme.onSurface),

        // Title
        titleLarge: AppStyles.regular22(
          context,
        ).copyWith(color: colorScheme.onSurface),
        titleMedium: AppStyles.semiBold16(
          context,
        ).copyWith(color: colorScheme.onSurface),
        titleSmall: AppStyles.medium14(
          context,
        ).copyWith(color: colorScheme.onSurface),

        // Body
        bodyLarge: AppStyles.regular16(
          context,
        ).copyWith(color: colorScheme.onSurface),
        bodyMedium: AppStyles.regular14(
          context,
        ).copyWith(color: colorScheme.onSurface),
        bodySmall: AppStyles.regular12(
          context,
        ).copyWith(color: colorScheme.onSurface),

        // Label
        labelLarge: AppStyles.medium14(
          context,
        ).copyWith(color: colorScheme.onSurface),
        labelMedium: AppStyles.medium12(
          context,
        ).copyWith(color: colorScheme.onSurface),
        labelSmall: AppStyles.medium11(
          context,
        ).copyWith(color: colorScheme.onSurface),
      ),
    );
  }

  static ThemeData lightTheme(BuildContext context, String languageCode) =>
      getTheme(
        context: context,
        fontFamily: languageCode == 'ar' ? 'Cairo' : 'Poppins',
        colorScheme: const ColorScheme(
          primaryContainer: ColorsLight.cardColor,
          brightness: Brightness.light,
          primary: ColorsLight.mainColor, // Brand Blue
          onPrimary: ColorsLight.white,
          secondary: ColorsLight.secondaryColor, // Light Blue
          onSecondary: ColorsLight.white,
          error: ColorsLight.error,
          onError: ColorsLight.white,
          surface: ColorsLight.background,
          onSurface: ColorsLight.fontColor,
        ),
        textFormFieldBorderColor: ColorsLight.grey,
      );

  static ThemeData darkTheme(BuildContext context, String languageCode) =>
      getTheme(
        context: context,
        fontFamily: languageCode == 'ar' ? 'Cairo' : 'Poppins',
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: ColorsDark.mainColor,
          onPrimary: ColorsDark.white,
          secondary: ColorsDark.blueDark,
          primaryContainer: ColorsDark.containerColor,
          onSecondary: ColorsDark.white,
          error: Colors.red,
          onError: ColorsDark.white,
          surface: ColorsDark.mainColor, // Dark background
          onSurface: ColorsDark.white, // Text color
        ),
        textFormFieldBorderColor: ColorsDark.black1,
      );
}
