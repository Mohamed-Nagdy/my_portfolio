import 'package:flutter/material.dart';

/// Midnight Tech design system — a premium, engineering-studio palette.
///
/// Two cohesive palettes (dark + light) sharing a single electric
/// azure→cyan signature accent. Access the active palette anywhere via
/// `context.c` and the shared gradients/tokens via the statics on [AppColors].
class AppPalette {
  const AppPalette({
    required this.bg,
    required this.bgAlt,
    required this.surface,
    required this.surfaceAlt,
    required this.glass,
    required this.glassStrong,
    required this.border,
    required this.borderStrong,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.accent,
    required this.accentAlt,
    required this.warm,
    required this.success,
    required this.isDark,
  });

  final Color bg;
  final Color bgAlt;
  final Color surface;
  final Color surfaceAlt;
  final Color glass;
  final Color glassStrong;
  final Color border;
  final Color borderStrong;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color accent;
  final Color accentAlt;
  final Color warm;
  final Color success;
  final bool isDark;
}

class AppColors {
  AppColors._();

  // Signature accents (shared across themes).
  static const Color accent = Color(0xFF38BDF8); // electric cyan
  static const Color accentDeep = Color(0xFF2563EB); // electric blue
  static const Color warm = Color(0xFFFFB454); // sparing warm highlight
  static const Color success = Color(0xFF34D399);

  // ViBE ZO brand (used on its featured tiles).
  static const Color vibezoPink = Color(0xFFDA5280);
  static const Color vibezoDeep = Color(0xFF572133);

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accentDeep, accent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient vibezoGradient = LinearGradient(
    colors: [Color(0xFFDA5280), Color(0xFF8E2D8C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const AppPalette dark = AppPalette(
    isDark: true,
    bg: Color(0xFF0A0B10),
    bgAlt: Color(0xFF0D0F16),
    surface: Color(0xFF12141C),
    surfaceAlt: Color(0xFF181B25),
    glass: Color(0x0FFFFFFF), // white @ ~6%
    glassStrong: Color(0x1AFFFFFF), // white @ ~10%
    border: Color(0x14FFFFFF), // white @ 8%
    borderStrong: Color(0x29FFFFFF), // white @ 16%
    textPrimary: Color(0xFFF5F7FA),
    textSecondary: Color(0xFFA6ADBB),
    textTertiary: Color(0xFF6B7280),
    accent: accent,
    accentAlt: accentDeep,
    warm: warm,
    success: success,
  );

  static const AppPalette light = AppPalette(
    isDark: false,
    bg: Color(0xFFF5F6F8),
    bgAlt: Color(0xFFEDEFF3),
    surface: Color(0xFFFFFFFF),
    surfaceAlt: Color(0xFFF1F3F7),
    glass: Color(0xCCFFFFFF), // translucent white
    glassStrong: Color(0xFFFFFFFF),
    border: Color(0xFFE3E6EC),
    borderStrong: Color(0xFFD2D7E0),
    textPrimary: Color(0xFF0B0E14),
    textSecondary: Color(0xFF4B5563),
    textTertiary: Color(0xFF8A93A3),
    accent: accentDeep,
    accentAlt: accent,
    warm: Color(0xFFE0941F),
    success: Color(0xFF12A66B),
  );
}

extension PaletteContext on BuildContext {
  /// The active Midnight Tech palette for the current brightness.
  AppPalette get c => Theme.of(this).brightness == Brightness.dark
      ? AppColors.dark
      : AppColors.light;
}
