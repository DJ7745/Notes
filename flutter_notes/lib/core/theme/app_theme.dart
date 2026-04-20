import 'package:flutter/material.dart';
import 'color_palettes.dart';

class AppTheme {
  static ThemeData getTheme(String paletteName, {bool isDark = false}) {
    final palettes = isDark ? AppPalettes.darkPalettes : AppPalettes.lightPalettes;
    final semantic = palettes[paletteName] ?? palettes['blue']!;

    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: semantic.primary,
      scaffoldBackgroundColor: semantic.background,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: semantic.primary,
        onPrimary: Colors.white,
        secondary: semantic.primary,
        onSecondary: Colors.white,
        error: Colors.redAccent,
        onError: Colors.white,
        surface: semantic.surface,
        onSurface: semantic.textPrimary,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: semantic.textPrimary),
        bodyMedium: TextStyle(color: semantic.textSecondary),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: semantic.surface,
        foregroundColor: semantic.textPrimary,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: semantic.surface,
        elevation: 2,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
