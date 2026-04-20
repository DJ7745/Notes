import 'package:flutter/material.dart';

class CommonPalette {
  static const Color white = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFEF4444);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color black12 = Color(0x1F000000);
}

class SemanticColors {
  final Color primary;
  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;

  const SemanticColors({
    required this.primary,
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
  });
}

class AppPalettes {
  static const Map<String, SemanticColors> lightPalettes = {
    'blue': SemanticColors(
      primary: Color(0xFF2563EB),
      background: Color(0xFFF8FAFC),
      surface: Color(0xFFFFFFFF),
      textPrimary: Color(0xFF0F172A),
      textSecondary: Color(0xFF64748B),
    ),
    'green': SemanticColors(
      primary: Color(0xFF16A34A),
      background: Color(0xFFF0FDF4),
      surface: Color(0xFFFFFFFF),
      textPrimary: Color(0xFF14532D),
      textSecondary: Color(0xFF166534),
    ),
    'purple': SemanticColors(
      primary: Color(0xFF9333EA),
      background: Color(0xFFFAF5FF),
      surface: Color(0xFFFFFFFF),
      textPrimary: Color(0xFF3B0764),
      textSecondary: Color(0xFF6B21A8),
    ),
  };

  static const Map<String, SemanticColors> darkPalettes = {
    'blue': SemanticColors(
      primary: Color(0xFF3B82F6),
      background: Color(0xFF0F172A),
      surface: Color(0xFF1E293B),
      textPrimary: Color(0xFFF8FAFC),
      textSecondary: Color(0xFF94A3B8),
    ),
    'green': SemanticColors(
      primary: Color(0xFF22C55E),
      background: Color(0xFF052E16),
      surface: Color(0xFF14532D),
      textPrimary: Color(0xFFF0FDF4),
      textSecondary: Color(0xFF86EFAC),
    ),
    'purple': SemanticColors(
      primary: Color(0xFFA855F7),
      background: Color(0xFF2E1065),
      surface: Color(0xFF3B0764),
      textPrimary: Color(0xFFFAF5FF),
      textSecondary: Color(0xFFD8B4FE),
    ),
  };
}
