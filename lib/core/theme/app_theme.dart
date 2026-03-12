import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ═══════════════════════════════════════════════════════════════════
//  DARK COLOR TOKENS
// ═══════════════════════════════════════════════════════════════════
class DarkColors {
  static const Color scaffold = Color(0xFF0F0E0D);
  static const Color surface = Color(0xFF1A1816);
  static const Color surface2 = Color(0xFF2A2520);
  static const Color surface3 = Color(0xFF342E28);
  static const Color textPrimary = Color(0xFFFEF3C7);
  static const Color textSecondary = Color(0xFFFCD34D);
  static const Color textMuted = Color(0xFFFBBF24);
  static const Color textDisabled = Color(0xFF7A7065);
  static const Color icon = Color(0xFFFBBF24);
  static const Color divider = Color(0x22D97706);
  static const Color border = Color(0x33D97706);
  static const Color inputFill = Color(0xFF1A1816);
  static const Color shimmerBase = Color(0xFF2A2520);
  static const Color shimmerHigh = Color(0xFF3A3028);
  static const Color verified = Color(0xFF22C55E);
  static const Color verifiedBg = Color(0x1A22C55E);
  static const Color verifiedBorder = Color(0x3322C55E);
}

// ═══════════════════════════════════════════════════════════════════
//  LIGHT COLOR TOKENS
// ═══════════════════════════════════════════════════════════════════
class LightColors {
  static const Color scaffold = Color(0xFFFFF8F0);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surface2 = Color(0xFFFFF0DC);
  static const Color surface3 = Color(0xFFFFE4BC);
  static const Color textPrimary = Color(0xFF1C1410);
  static const Color textSecondary = Color(0xFF78350F);
  static const Color textMuted = Color(0xFFA16207);
  static const Color textDisabled = Color(0xFFB0A090);
  static const Color icon = Color(0xFFD97706);
  static const Color divider = Color(0x22D97706);
  static const Color border = Color(0x44D97706);
  static const Color inputFill = Color(0xFFFFF0DC);
  static const Color shimmerBase = Color(0xFFE8DDD0);
  static const Color shimmerHigh = Color(0xFFF5EDE3);
  static const Color verified = Color(0xFF16A34A);
  static const Color verifiedBg = Color(0x1A16A34A);
  static const Color verifiedBorder = Color(0x3316A34A);
}

// ═══════════════════════════════════════════════════════════════════
//  SHARED BRAND / ACCENT COLORS  (same in both modes)
// ═══════════════════════════════════════════════════════════════════
class AppColors {
  // ── Brand accents ────────────────────────────────────────────────
  static const Color amber50 = Color(0xFFFFFBEB);
  static const Color amber100 = Color(0xFFFEF3C7);
  static const Color amber300 = Color(0xFFFCD34D);
  static const Color amber400 = Color(0xFFFBBF24);
  static const Color amber600 = Color(0xFFD97706);
  static const Color orange600 = Color(0xFFEA580C);
  static const Color error = Color(0xFFEF4444);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [amber600, orange600],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // ── Adaptive helpers ─────────────────────────────────────────────
  static bool _dark(BuildContext c) =>
      Theme.of(c).brightness == Brightness.dark;

  static Color scaffold(BuildContext c) =>
      _dark(c) ? DarkColors.scaffold : LightColors.scaffold;
  static Color surface(BuildContext c) =>
      _dark(c) ? DarkColors.surface : LightColors.surface;
  static Color surface2(BuildContext c) =>
      _dark(c) ? DarkColors.surface2 : LightColors.surface2;
  static Color surface3(BuildContext c) =>
      _dark(c) ? DarkColors.surface3 : LightColors.surface3;
  static Color textPrimary(BuildContext c) =>
      _dark(c) ? DarkColors.textPrimary : LightColors.textPrimary;
  static Color textSecondary(BuildContext c) =>
      _dark(c) ? DarkColors.textSecondary : LightColors.textSecondary;
  static Color textMuted(BuildContext c) =>
      _dark(c) ? DarkColors.textMuted : LightColors.textMuted;
  static Color textDisabled(BuildContext c) =>
      _dark(c) ? DarkColors.textDisabled : LightColors.textDisabled;
  static Color icon(BuildContext c) =>
      _dark(c) ? DarkColors.icon : LightColors.icon;
  static Color dividerColor(BuildContext c) =>
      _dark(c) ? DarkColors.divider : LightColors.divider;
  static Color border(BuildContext c) =>
      _dark(c) ? DarkColors.border : LightColors.border;
  static Color inputFill(BuildContext c) =>
      _dark(c) ? DarkColors.inputFill : LightColors.inputFill;
  static Color shimmerBase(BuildContext c) =>
      _dark(c) ? DarkColors.shimmerBase : LightColors.shimmerBase;
  static Color shimmerHigh(BuildContext c) =>
      _dark(c) ? DarkColors.shimmerHigh : LightColors.shimmerHigh;
  static Color verified(BuildContext c) =>
      _dark(c) ? DarkColors.verified : LightColors.verified;
  static Color verifiedBg(BuildContext c) =>
      _dark(c) ? DarkColors.verifiedBg : LightColors.verifiedBg;
  static Color verifiedBorder(BuildContext c) =>
      _dark(c) ? DarkColors.verifiedBorder : LightColors.verifiedBorder;

  // Shorthand via ColorScheme (use in places without BuildContext)
  static Color fromScheme(ColorScheme s, {bool preferSurface = false}) =>
      preferSurface ? s.surface : s.primary;
}

// ═══════════════════════════════════════════════════════════════════
//  THEME BUILDER
// ═══════════════════════════════════════════════════════════════════
class AppTheme {
  // ── DARK ──────────────────────────────────────────────────────────
  static ThemeData get darkTheme {
    return FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: AppColors.amber600,
        primaryContainer: DarkColors.surface2,
        secondary: AppColors.orange600,
        secondaryContainer: DarkColors.surface,
        tertiary: AppColors.amber300,
        tertiaryContainer: DarkColors.surface,
        appBarColor: DarkColors.scaffold,
        error: AppColors.error,
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
    ).copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DarkColors.scaffold,
      appBarTheme: const AppBarTheme(
        backgroundColor: DarkColors.scaffold,
        foregroundColor: DarkColors.textPrimary,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: DarkColors.icon),
        actionsIconTheme: IconThemeData(color: DarkColors.icon),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: DarkColors.surface,
        selectedItemColor: AppColors.amber400,
        unselectedItemColor: DarkColors.textDisabled,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      cardTheme: const CardThemeData(
        color: DarkColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      dividerTheme: const DividerThemeData(color: DarkColors.divider, space: 1),
      listTileTheme: const ListTileThemeData(
        tileColor: DarkColors.surface,
        textColor: DarkColors.textPrimary,
        iconColor: DarkColors.icon,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: DarkColors.inputFill,
        filled: true,
        hintStyle: const TextStyle(color: DarkColors.textDisabled),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: DarkColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: DarkColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.amber600),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),
      textTheme: _textTheme(isDark: true),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.amber600,
        secondary: AppColors.orange600,
        surface: DarkColors.surface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: DarkColors.textPrimary,
        outline: DarkColors.border,
        error: AppColors.error,
      ),
    );
  }

  // ── LIGHT ─────────────────────────────────────────────────────────
  static ThemeData get lightTheme {
    return FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: AppColors.amber600,
        primaryContainer: LightColors.surface2,
        secondary: AppColors.orange600,
        secondaryContainer: LightColors.surface,
        tertiary: Color(0xFFA16207),
        tertiaryContainer: LightColors.surface2,
        appBarColor: LightColors.scaffold,
        error: AppColors.error,
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 5,
      subThemesData: const FlexSubThemesData(
        cardRadius: 16.0,
        elevatedButtonRadius: 12.0,
        inputDecoratorRadius: 12.0,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        blendOnColors: false,
      ),
    ).copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: LightColors.scaffold,
      appBarTheme: AppBarTheme(
        backgroundColor: LightColors.scaffold,
        foregroundColor: LightColors.textPrimary,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.amber600.withValues(alpha: 0.06),
        iconTheme: const IconThemeData(color: LightColors.icon),
        actionsIconTheme: const IconThemeData(color: LightColors.icon),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: LightColors.surface,
        selectedItemColor: AppColors.amber600,
        unselectedItemColor: LightColors.textDisabled,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: LightColors.surface,
        elevation: 0,
        shadowColor: AppColors.amber600.withValues(alpha: 0.07),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: LightColors.border, width: 0.8),
        ),
      ),
      dividerTheme:
          const DividerThemeData(color: LightColors.divider, space: 1),
      listTileTheme: const ListTileThemeData(
        tileColor: LightColors.surface,
        textColor: LightColors.textPrimary,
        iconColor: LightColors.icon,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: LightColors.inputFill,
        filled: true,
        hintStyle: const TextStyle(color: LightColors.textDisabled),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: LightColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: LightColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.amber600),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),
      textTheme: _textTheme(isDark: false),
      colorScheme: const ColorScheme.light(
        primary: AppColors.amber600,
        secondary: AppColors.orange600,
        surface: LightColors.surface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: LightColors.textPrimary,
        outline: LightColors.border,
        error: AppColors.error,
      ),
    );
  }

  // ── TYPOGRAPHY ────────────────────────────────────────────────────
  static TextTheme _textTheme({required bool isDark}) {
    final p = isDark ? DarkColors.textPrimary : LightColors.textPrimary;
    final s = isDark ? DarkColors.textSecondary : LightColors.textSecondary;
    final m = isDark ? DarkColors.textMuted : LightColors.textMuted;

    return TextTheme(
      displayLarge: GoogleFonts.playfairDisplay(
        fontSize: 57,
        fontWeight: FontWeight.w900,
        color: p,
        height: 1.1,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 45,
        fontWeight: FontWeight.w700,
        color: p,
      ),
      displaySmall: GoogleFonts.playfairDisplay(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: p,
      ),
      headlineLarge: GoogleFonts.playfairDisplay(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: p,
      ),
      headlineMedium: GoogleFonts.playfairDisplay(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: p,
      ),
      headlineSmall: GoogleFonts.playfairDisplay(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: p,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: p,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: p,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: s,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: p.withValues(alpha: 0.85),
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: s.withValues(alpha: 0.85),
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: m.withValues(alpha: 0.7),
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
