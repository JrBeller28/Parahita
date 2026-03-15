import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1A2B4A);      // Deep Navy
  static const Color secondary = Color(0xFFC8A84B);    // Gold
  static const Color accent = Color(0xFFE8F0FE);       // Light Blue
  static const Color surface = Color(0xFFF8F7F4);      // Warm White
  static const Color dark = Color(0xFF0D1B2A);         // Almost Black
  static const Color textPrimary = Color(0xFF1A2B4A);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color divider = Color(0xFFE5E7EB);
  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFEF4444);
}

class AppTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
      background: AppColors.surface,
    ),
    fontFamily: 'Outfit',
    scaffoldBackgroundColor: AppColors.surface,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Playfair',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        letterSpacing: 0.5,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w700,
          fontSize: 15,
          letterSpacing: 0.5,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.divider),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.divider),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      labelStyle: const TextStyle(color: AppColors.textSecondary, fontFamily: 'Outfit'),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      shadowColor: AppColors.primary.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}

class AppStrings {
  static const String appName = 'Parahita';
  static const String tagline = 'The Real Uniform & Promotion';
  static const String about = 
    'Parahita berdiri pada tahun 1990 sebagai PT. Parahita Sanu Setia. '
    'Kami adalah perusahaan pakaian jadi dengan konsep waralaba yang menghasilkan '
    'produk berkualitas tinggi untuk berbagai kebutuhan industri dan korporasi.';
  static const String address = 'Kawasan Industri Multiguna Blok B No. 10A';
  static const String phone = '021-5399261';
  static const String hours = 'Senin–Jumat: 08.00–17.00 | Sabtu: 08.00–15.00';
  static const String email = 'info@seragamparahita.com';
  static const String website = 'https://seragamparahita.com';
  static const String waNumber = '6281234567890'; // Ganti dengan nomor WA aktual
}
