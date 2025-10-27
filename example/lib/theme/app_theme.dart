import 'package:flutter/material.dart';
import 'package:consts/flutter_const.dart';
import 'theme.dart' as app_colors;

/// Tema moderno y oscuro de la aplicación
class AppTheme {
  AppTheme._();

  /// Theme oscuro personalizado usando los colores de theme.dart
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Colores principales
      scaffoldBackgroundColor: app_colors.bgDark,

      colorScheme: ColorScheme.dark(
        // Colores de superficie
        surface: app_colors.bg,
        surfaceContainerHighest: app_colors.bgLight,

        // Colores primarios
        primary: app_colors.primary,
        onPrimary: app_colors.text,
        primaryContainer: app_colors.primary.withValues(alpha: 0.2),
        onPrimaryContainer: app_colors.primary,

        // Colores secundarios
        secondary: app_colors.secondary,
        onSecondary: app_colors.text,
        secondaryContainer: app_colors.secondary.withValues(alpha: 0.2),
        onSecondaryContainer: app_colors.secondary,

        // Colores de error
        error: app_colors.danger,
        onError: app_colors.text,

        // Bordes
        outline: app_colors.border,
        outlineVariant: app_colors.borderMuted,
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: app_colors.bg,
        elevation: AppUI.elevationSm,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.borderLg,
          side: BorderSide(color: app_colors.border, width: 1),
        ),
        margin: EdgeInsets.zero,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: app_colors.bg,
        foregroundColor: app_colors.text,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.header,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: app_colors.text, size: AppUI.iconLg),
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.display,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.h1,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.h2,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.h3,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.header,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.subheader,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.paragraphTitle,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.bodyLarge,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.body,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.bodyLarge,
        ),
        bodyMedium: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.body,
        ),
        bodySmall: TextStyle(
          color: app_colors.textMuted,
          fontSize: AppFontSizesConstants.bodySmall,
        ),
        labelLarge: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.body,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: app_colors.textMuted,
          fontSize: AppFontSizesConstants.bodySmall,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: app_colors.textMuted,
          fontSize: AppFontSizesConstants.bodySmall,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: app_colors.bgLight,
        border: OutlineInputBorder(
          borderRadius: AppRadius.borderMd,
          borderSide: BorderSide(color: app_colors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.borderMd,
          borderSide: BorderSide(color: app_colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.borderMd,
          borderSide: BorderSide(color: app_colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.borderMd,
          borderSide: BorderSide(color: app_colors.danger),
        ),
        contentPadding: AppSpacing.paddingMd,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: app_colors.primary,
          foregroundColor: app_colors.bgDark,
          elevation: AppUI.elevationSm,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.borderMd),
          textStyle: TextStyle(
            fontSize: AppFontSizesConstants.body,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: app_colors.primary,
          side: BorderSide(color: app_colors.border),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.borderMd),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: app_colors.primary,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: app_colors.bgLight,
        selectedColor: app_colors.primary.withValues(alpha: 0.2),
        labelStyle: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.bodySmall,
        ),
        side: BorderSide(color: app_colors.border),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderSm),
        padding: AppSpacing.paddingSm,
      ),

      // Navigation Bar Theme
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: app_colors.bg,
        indicatorColor: app_colors.primary.withValues(alpha: 0.2),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              color: app_colors.primary,
              fontSize: AppFontSizesConstants.bodySmall,
              fontWeight: FontWeight.w600,
            );
          }
          return TextStyle(
            color: app_colors.textMuted,
            fontSize: AppFontSizesConstants.bodySmall,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: app_colors.primary, size: AppUI.iconLg);
          }
          return IconThemeData(color: app_colors.textMuted, size: AppUI.iconLg);
        }),
      ),

      // Navigation Rail Theme
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: app_colors.bg,
        selectedIconTheme: IconThemeData(
          color: app_colors.primary,
          size: AppUI.iconLg,
        ),
        unselectedIconTheme: IconThemeData(
          color: app_colors.textMuted,
          size: AppUI.iconLg,
        ),
        selectedLabelTextStyle: TextStyle(
          color: app_colors.primary,
          fontSize: AppFontSizesConstants.bodySmall,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelTextStyle: TextStyle(
          color: app_colors.textMuted,
          fontSize: AppFontSizesConstants.bodySmall,
        ),
        indicatorColor: app_colors.primary.withValues(alpha: 0.2),
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: app_colors.border,
        thickness: 1,
        space: AppSpacing.md,
      ),

      // Icon Theme
      iconTheme: IconThemeData(color: app_colors.text, size: AppUI.iconLg),

      // Tooltip Theme
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: app_colors.bgLight,
          borderRadius: AppRadius.borderSm,
          border: Border.all(color: app_colors.border),
        ),
        textStyle: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.bodySmall,
        ),
        padding: AppSpacing.paddingSm,
        waitDuration: AppDurations.tooltipDelay,
      ),

      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: app_colors.bgLight,
        contentTextStyle: TextStyle(
          color: app_colors.text,
          fontSize: AppFontSizesConstants.body,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.borderMd,
          side: BorderSide(color: app_colors.border),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: AppUI.elevationMd,
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: app_colors.bg,
        elevation: AppUI.elevationXxl,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.borderLg,
          side: BorderSide(color: app_colors.border),
        ),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: app_colors.bg,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderTopLg),
        elevation: AppUI.elevationXl,
      ),
    );
  }

  /// Colores personalizados adicionales
  static Color get successColor => app_colors.success;
  static Color get warningColor => app_colors.warning;
  static Color get infoColor => app_colors.info;
  static Color get highlightColor => app_colors.highlight;
}
