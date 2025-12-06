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
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        backgroundColor: colorScheme.surface,
        elevation: 0,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(18),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
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

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.all(16),
          disabledBackgroundColor: Colors.grey,
          backgroundColor: colorScheme.primary,
          foregroundColor: Colors.white,
          disabledForegroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
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
          brightness: Brightness.light,
          primary: ColorsLight.mainColor, // Using Main Color
          onPrimary: ColorsLight.white,
          secondary: ColorsLight.black,
          onSecondary: ColorsLight.white,
          error: ColorsLight.pinkDark,
          onError: ColorsLight.white,
          surface: ColorsLight.white,
          onSurface: ColorsLight.black,
        ),
        textFormFieldBorderColor: Colors.grey,
      );

  static ThemeData darkTheme(BuildContext context, String languageCode) =>
      getTheme(
        context: context,
        fontFamily: languageCode == 'ar' ? 'Cairo' : 'Poppins',
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: ColorsDark.blueLight,
          onPrimary: ColorsDark.white,
          secondary: ColorsDark.blueDark,
          onSecondary: ColorsDark.white,
          error: Colors.red,
          onError: ColorsDark.white,
          surface: ColorsDark.mainColor, // Dark background
          onSurface: ColorsDark.white, // Text color
        ),
        textFormFieldBorderColor: ColorsDark.black1,
      );
}
