import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

// ── Legacy color aliases ─────────────────────────────────────────────
// Kept so older widgets keep compiling; new code should prefer `context.c`.
const Color whiteColor = Colors.white;
const Color blackColor = AppColorsLegacy.ink;
const Color successGreen = AppColors.success;
const Color primaryColor = AppColors.accent;
const Color secondaryColor = AppColors.accentDeep;

class AppColorsLegacy {
  static const Color ink = Color(0xFF0B0E14);
}

/// Backwards-compatible gray swatch mapped onto the Midnight Tech ramp.
const MaterialColor graySwatch = MaterialColor(0xFF0A0B10, {
  50: Color(0xFFF5F6F8),
  100: Color(0xFFEDEFF3),
  200: Color(0xFFD2D7E0),
  300: Color(0xFFA6ADBB),
  400: Color(0xFF6B7280),
  500: Color(0xFF4B5563),
  600: Color(0xFF323844),
  700: Color(0xFF181B25),
  800: Color(0xFF12141C),
  900: Color(0xFF0A0B10),
});

/// Default body font family handle (Manrope).
final String? fontFamily = GoogleFonts.manrope().fontFamily;

TextTheme _buildTextTheme(AppPalette p) {
  final body = GoogleFonts.manropeTextTheme();
  final display = GoogleFonts.bricolageGrotesque().fontFamily;

  final Color t = p.textPrimary;
  final Color t2 = p.textSecondary;

  return body.copyWith(
    displayLarge: TextStyle(
        fontFamily: display,
        fontWeight: FontWeight.w800,
        height: 1.02,
        letterSpacing: -1.5,
        color: t),
    displayMedium: TextStyle(
        fontFamily: display,
        fontWeight: FontWeight.w800,
        height: 1.04,
        letterSpacing: -1.0,
        color: t),
    displaySmall: TextStyle(
        fontFamily: display,
        fontWeight: FontWeight.w700,
        height: 1.06,
        letterSpacing: -0.5,
        color: t),
    headlineLarge: TextStyle(
        fontFamily: display,
        fontWeight: FontWeight.w700,
        height: 1.1,
        letterSpacing: -0.5,
        fontSize: 34,
        color: t),
    headlineMedium: TextStyle(
        fontFamily: display,
        fontWeight: FontWeight.w700,
        height: 1.15,
        letterSpacing: -0.3,
        fontSize: 27,
        color: t),
    headlineSmall: TextStyle(
        fontFamily: display,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: -0.2,
        fontSize: 22,
        color: t),
    titleLarge: GoogleFonts.manrope(
        fontWeight: FontWeight.w700, fontSize: 20, color: t),
    titleMedium: GoogleFonts.manrope(
        fontWeight: FontWeight.w600, fontSize: 17, color: t),
    titleSmall: GoogleFonts.manrope(
        fontWeight: FontWeight.w600, fontSize: 15, color: t),
    bodyLarge: GoogleFonts.manrope(
        fontWeight: FontWeight.w400, fontSize: 17, height: 1.6, color: t2),
    bodyMedium: GoogleFonts.manrope(
        fontWeight: FontWeight.w400, fontSize: 15, height: 1.65, color: t2),
    bodySmall: GoogleFonts.manrope(
        fontWeight: FontWeight.w400, fontSize: 13, height: 1.6, color: t2),
    labelLarge: GoogleFonts.manrope(
        fontWeight: FontWeight.w600, fontSize: 15, color: t),
    labelMedium: GoogleFonts.manrope(
        fontWeight: FontWeight.w600, fontSize: 13, color: t),
    labelSmall: GoogleFonts.manrope(
        fontWeight: FontWeight.w500, fontSize: 12, color: t2),
  );
}

/// Monospace style for technical kicker labels / section numbers / tags.
TextStyle monoLabel(BuildContext context,
    {Color? color, double size = 12, double spacing = 2.5}) {
  return GoogleFonts.jetBrainsMono(
    fontSize: size,
    fontWeight: FontWeight.w500,
    letterSpacing: spacing,
    color: color ?? Theme.of(context).colorScheme.primary,
  );
}

ThemeData _theme(AppPalette p) {
  final scheme =
      (p.isDark ? const ColorScheme.dark() : const ColorScheme.light())
          .copyWith(
    primary: p.accent,
    secondary: p.accentAlt,
    surface: p.surface,
    onSurface: p.textPrimary,
    error: const Color(0xFFFF5C5C),
  );

  return ThemeData(
    useMaterial3: true,
    brightness: p.isDark ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: p.bg,
    canvasColor: p.bg,
    colorScheme: scheme,
    primaryColor: p.accent,
    fontFamily: fontFamily,
    textTheme: _buildTextTheme(p),
    dividerColor: p.border,
    dividerTheme: DividerThemeData(color: p.border, thickness: 1, space: 1),
    iconTheme: IconThemeData(color: p.textSecondary, size: 22),
    cardColor: p.surface,
    splashFactory: InkSparkle.splashFactory,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 72,
      titleTextStyle: TextStyle(color: p.textPrimary),
      iconTheme: IconThemeData(color: p.textPrimary),
    ),
    drawerTheme: DrawerThemeData(backgroundColor: p.surface),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStatePropertyAll(p.borderStrong),
      thickness: const WidgetStatePropertyAll(6),
      radius: const Radius.circular(8),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: p.surfaceAlt,
      contentTextStyle: TextStyle(color: p.textPrimary),
      behavior: SnackBarBehavior.floating,
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: p.surfaceAlt,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: p.border),
      ),
      textStyle: TextStyle(color: p.textPrimary, fontSize: 12),
    ),
  );
}

ThemeData appTheme([String? _]) => _theme(AppColors.light);

ThemeData darkTheme([String? _]) => _theme(AppColors.dark);
