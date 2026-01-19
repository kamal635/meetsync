import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Defines the primary font family used throughout the app.
final class AppFonts {
  AppFonts._();

  /// The primary font family used in the app.
  static const String primary = 'Inter';
}

/// Defines the text styles used throughout the app.
final class AppTextStyles {
  AppTextStyles._();

  static TextStyle _base({
    required double size,
    required FontWeight weight,
    double height = 1.25,
    double letterSpacing = 0,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: AppFonts.primary,
      fontSize: size.sp,
      fontWeight: weight,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  // --- Display / Headlines (used for big titles) ---

  /// Large display text (rarely used, e.g., landing hero).
  static TextStyle displayLarge({Color? color}) => _base(
    size: 38,
    weight: FontWeight.w800,
    height: 1.08,
    letterSpacing: -0.6,
    color: color,
  );

  /// Main screen headline (e.g., "Welcome back").
  static TextStyle headlineLarge({Color? color}) => _base(
    size: 30,
    weight: FontWeight.w800,
    height: 1.12,
    letterSpacing: -0.6,
    color: color,
  );

  /// Secondary headline (section headers).
  static TextStyle headlineMedium({Color? color}) => _base(
    size: 24,
    weight: FontWeight.w700,
    height: 1.16,
    letterSpacing: -0.4,
    color: color,
  );

  // --- Titles (used for card titles, dialog titles) ---

  /// Card/Dialog title (e.g., "Sign in").
  static TextStyle titleLarge({Color? color}) => _base(
    size: 20,
    weight: FontWeight.w700,
    height: 1.18,
    letterSpacing: -0.2,
    color: color,
  );

  /// Smaller title (e.g., list item title).
  static TextStyle titleMedium({Color? color}) => _base(
    size: 16,
    weight: FontWeight.w600,
    height: 1.22,
    letterSpacing: -0.1,
    color: color,
  );

  // --- Body (used for regular text) ---

  /// Primary body text.
  static TextStyle bodyLarge({Color? color}) => _base(
    size: 16,
    weight: FontWeight.w400, // key change: lighter, more "social app"
    height: 1.45,
    letterSpacing: 0,
    color: color,
  );

  /// Secondary body text (subtitles, descriptions).
  static TextStyle bodyMedium({Color? color}) => _base(
    size: 14,
    weight: FontWeight.w400,
    height: 1.50,
    letterSpacing: 0,
    color: color,
  );

  /// Small body text (helper text).
  static TextStyle bodySmall({Color? color}) => _base(
    size: 12,
    weight: FontWeight.w400,
    height: 1.45,
    letterSpacing: 0,
    color: color,
  );

  // --- Labels (used for buttons, chips, field labels) ---

  /// Button/field label.
  static TextStyle labelLarge({Color? color}) => _base(
    size: 13,
    weight: FontWeight.w600,
    height: 1.20,
    letterSpacing: 0,
    color: color,
  );

  /// Smaller label (captions).
  static TextStyle labelMedium({Color? color}) => _base(
    size: 12,
    weight: FontWeight.w600,
    height: 1.15,
    letterSpacing: 0.1,
    color: color,
  );

  /// Small caption label.
  static TextStyle labelSmall({Color? color}) => _base(
    size: 11,
    weight: FontWeight.w600,
    height: 1.15,
    letterSpacing: 0.2,
    color: color,
  );

  /// Generates a TextTheme based on the provided ColorScheme.
  /// Note:
  /// - Use onSurface for primary text
  /// - Use onSurfaceVariant for secondary text
  static TextTheme textTheme(ColorScheme cs) {
    return TextTheme(
      displayLarge: displayLarge(color: cs.onSurface),
      headlineLarge: headlineLarge(color: cs.onSurface),
      headlineMedium: headlineMedium(color: cs.onSurface),

      titleLarge: titleLarge(color: cs.onSurface),
      titleMedium: titleMedium(color: cs.onSurface),

      bodyLarge: bodyLarge(color: cs.onSurface),
      bodyMedium: bodyMedium(color: cs.onSurfaceVariant),
      bodySmall: bodySmall(color: cs.onSurfaceVariant),

      labelLarge: labelLarge(color: cs.onSurface),
      labelMedium: labelMedium(color: cs.onSurfaceVariant),
      labelSmall: labelSmall(color: cs.onSurfaceVariant),
    );
  }
}
