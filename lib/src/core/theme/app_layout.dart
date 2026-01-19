import 'package:flutter/widgets.dart';

/// Layout configuration for responsive scaling.
final class AppLayout {
  AppLayout._();

  /// Returns a baseline design size based on the current device class.
  /// This keeps scaling reasonable on tablets and small phones.
  static Size designSizeFor(Size deviceLogicalSize) {
    final shortestSide = deviceLogicalSize.shortestSide;

    // Tablets (600dp+ is a common Material breakpoint)
    if (shortestSide >= 600) {
      return const Size(834, 1194);
    }

    // Phones
    return const Size(390, 844);
  }
}
