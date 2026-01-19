import 'package:flutter/material.dart';

/// App color tokens.
/// Keep this small. Prefer ColorScheme for most UI colors.
final class AppColors {
  AppColors._();

  /// The primary seed color for the app's color scheme.
  static const Color seed = Color.fromARGB(255, 0, 208, 255);

  /// Success color used to indicate successful operations.
  static const Color success = Color(0xFF16A34A);

  /// Warning color used to indicate cautionary states.
  static const Color warning = Color(0xFFF59E0B);

  /// Danger color used to indicate errors or critical states.
  static const Color danger = Color(0xFFDC2626);
}
