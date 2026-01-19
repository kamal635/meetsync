import 'package:flutter/material.dart';
import 'package:meetsync/src/core/theme/app_colors.dart';

/// Extension on ColorScheme to include custom app colors.
extension ColorSchemeX on ColorScheme {
  /// The primary seed color for the app's color scheme.
  Color get success => AppColors.success;

  /// Warning color used to indicate cautionary states.
  Color get warning => AppColors.warning;

  /// Danger color used to indicate errors or critical states.
  Color get danger => AppColors.danger;
}
