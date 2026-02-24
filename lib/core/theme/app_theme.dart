import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ─── Dark Mode Colors ──────────────────────────────────────────────────────
class DarkColors {
  static const Color background = Color(0xFF0F0E0D);
  static const Color surface = Color(0xFF1A1816);
  static const Color surface2 = Color(0xFF2A2520);
  static const Color textPrimary = Color(0xFFFEF3C7);
  static const Color textSecondary = Color(0xFFFCD34D);
  static const Color textMuted = Color(0xFFFBBF24);
  static const Color border = Color(0xFFD97706);
  static const Color cardBg = Color(0xFF1A1816);
  static const Color navBg = Color(0xFF1A1816);
  static const Color inputFill = Color(0xFF1A1816);
  static const Color divider = Color(0x33D97706);
  static const Color shimmerBase = Color(0xFF2A2520);
  static const Color shimmerHigh = Color(0xFF3A3028);
  static const Color iconColor = Color(0xFFFBBF24);
}

// ─── Light Mode Colors ─────────────────────────────────────────────────────
class LightColors {
  static const Color background = Color(0xFFFFF8F0);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surface2 = Color(0xFFFFF0DC);
  static const Color textPrimary = Color(0xFF1C1410);
  static const Color textSecondary = Color(0xFF78350F);
  static const Color textMuted = Color(0xFFA16207);
  static const Color border = Color(0xFFD97706);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color navBg = Color(0xFFFFFFFF);
  static const Color inputFill = Color(0xFFFFF0DC);
  static const Color divider = Color(0x33D97706);
  static const Color shimmerBase = Color(0xFFE8DDD0);
  static const Color shimmerHigh = Color(0xFFF5EDE3);
  static const Color iconColor = Color(0xFFD97706);
}

// ─── Shared Accent Colors (same in both modes) ─────────────────────────────
class AppColors {
  // Accents — never change between themes
  static const Color amber50 = Color(0xFFFFFBEB);
  static const Color amber100 = Color(0xFFFEF3C7);
  static const Color amber300 = Color(0xFFFCD34D);
  static const Color amber400 = Color(0xFFFBBF24);
  static const Color amber600 = Color(0xFFD97706);
  static const Color orange600 = Color(0xFFEA580C);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [amber600, orange600],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Helpers — call from widgets using Theme.of(context).brightness
  static Color background(BuildContext ctx) =>
      _isDark(ctx) ? DarkColors.background : LightColors.background;
  static Color surface(BuildContext ctx) =>
      _isDark(ctx) ? DarkColors.surface : LightColors.surface;
  static Color surface2(BuildContext ctx) =>
      _isDark(ctx) ? DarkColors.surface2 : LightColors.surface2;
  static Color textPrimary(BuildContext ctx) =>
      _isDark(ctx) ? DarkColors.textPrimary : LightColors.textPrimary;
  static Color textSecondary(BuildContext ctx) =>
      _isDark(ctx) ? DarkColors.textSecondary : LightColors.textSecondary;
  static Color textMuted(BuildContext ctx) =>
      _isDark(ctx) ? DarkColors.textMuted : LightColors.textMuted;
  static Color cardBg(BuildContext ctx) =>
      _isDark(ctx) ? DarkColors.cardBg : LightColors.cardBg;
  static Color navBg(BuildContext ctx) =>
      _isDark(ctx) ? DarkColors.navBg : LightColors.navBg;
  static Color inputFill(BuildContext ctx) =>
      _isDark(ctx) ? DarkColors.inputFill : LightColors.inputFill;
  static Color shimmerBase(BuildContext ctx) =>
      _isDark(ctx) ? DarkColors.shimmerBase : LightColors.shimmerBase;
  static Color shimmerHigh(BuildContext ctx) =>
      _isDark(ctx) ? DarkColors.shimmerHigh : LightColors.shimmerHigh;
  static Color iconColor(BuildContext ctx) =>
      _isDark(ctx) ? DarkColors.iconColor : LightColors.iconColor;

  static bool _isDark(BuildContext ctx) =>
      Theme.of(ctx).brightness == Brightness.dark;
}

// ─── Theme Builder ─────────────────────────────────────────────────────────
class AppTheme {
  // ── DARK ────────────────────────────────────────────────────────────────
  static ThemeData get darkTheme {
    final base = FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: AppColors.amber600,
        primaryContainer: DarkColors.surface2,
        secondary: AppColors.orange600,
        secondaryContainer: DarkColors.surface,
        tertiary: AppColors.amber300,
        tertiaryContainer: DarkColors.surface,
        appBarColor: DarkColors.background,
        error: Color(0xFFCF6679),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 15,
      subThemesData: const FlexSubThemesData(
        cardRadius: 16.0,
        elevatedButtonRadius: 12.0,
        inputDecoratorRadius: 12.0,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        blendOnColors: true,
      ),
    );

    return base.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DarkColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: DarkColors.background,
        foregroundColor: DarkColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: DarkColors.iconColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: DarkColors.navBg,
        selectedItemColor: AppColors.amber400,
        unselectedItemColor: Color(0xFF6B6560),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      cardTheme: const CardThemeData(
        color: DarkColors.cardBg,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      dividerColor: DarkColors.divider,
      textTheme: _buildTextTheme(isDark: true),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.amber600,
        secondary: AppColors.orange600,
        surface: DarkColors.surface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: DarkColors.textPrimary,
      ),
    );
  }

  // ── LIGHT ───────────────────────────────────────────────────────────────
  static ThemeData get lightTheme {
    final base = FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: AppColors.amber600,
        primaryContainer: LightColors.surface2,
        secondary: AppColors.orange600,
        secondaryContainer: LightColors.surface,
        tertiary: Color(0xFFA16207), // amber-700
        tertiaryContainer: LightColors.surface2,
        appBarColor: LightColors.background,
        error: Color(0xFFB00020),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        cardRadius: 16.0,
        elevatedButtonRadius: 12.0,
        inputDecoratorRadius: 12.0,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        blendOnColors: false,
      ),
    );

    return base.copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: LightColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: LightColors.background,
        foregroundColor: LightColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.amber600.withValues(alpha: 0.08),
        iconTheme: const IconThemeData(color: AppColors.amber600),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: LightColors.navBg,
        selectedItemColor: AppColors.amber600,
        unselectedItemColor: Color(0xFFB0A090),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: LightColors.cardBg,
        elevation: 0,
        shadowColor: AppColors.amber600.withValues(alpha: 0.08),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: Color(0xFFEDD9A3), width: 0.5),
        ),
      ),
      dividerColor: LightColors.divider,
      textTheme: _buildTextTheme(isDark: false),
      colorScheme: const ColorScheme.light(
        primary: AppColors.amber600,
        secondary: AppColors.orange600,
        surface: LightColors.surface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: LightColors.textPrimary,
      ),
    );
  }

  // ── TYPOGRAPHY ──────────────────────────────────────────────────────────
  static TextTheme _buildTextTheme({required bool isDark}) {
    final primary = isDark ? DarkColors.textPrimary : LightColors.textPrimary;
    final secondary =
        isDark ? DarkColors.textSecondary : LightColors.textSecondary;
    final muted = isDark ? DarkColors.textMuted : LightColors.textMuted;

    return TextTheme(
      displayLarge: GoogleFonts.playfairDisplay(
        fontSize: 57,
        fontWeight: FontWeight.w900,
        color: primary,
        height: 1.1,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 45,
        fontWeight: FontWeight.w700,
        color: primary,
      ),
      displaySmall: GoogleFonts.playfairDisplay(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      headlineLarge: GoogleFonts.playfairDisplay(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: primary,
      ),
      headlineMedium: GoogleFonts.playfairDisplay(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      headlineSmall: GoogleFonts.playfairDisplay(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: primary,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: secondary,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: primary.withValues(alpha: 0.85),
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: secondary.withValues(alpha: 0.8),
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: muted.withValues(alpha: 0.65),
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 0.5,
      ),
    );
  }
}
