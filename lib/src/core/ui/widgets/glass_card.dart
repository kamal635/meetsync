import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A glassmorphic card widget
class GlassCard extends StatelessWidget {
  /// Constructor
  const GlassCard({
    required this.child,
    super.key,
    this.padding,
  });

  /// The child widget to display inside the glass card
  final Widget child;

  /// Optional padding inside the glass card
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(26.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 18,
          sigmaY: 18,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: cs.surface.withValues(alpha: 0.30),
            borderRadius: BorderRadius.circular(26.r),
            border: Border.all(
              color: cs.outlineVariant.withValues(alpha: 0.35),
              width: 1,
            ),
          ),
          child: Padding(
            padding: padding ?? EdgeInsets.all(18.r),
            child: child,
          ),
        ),
      ),
    );
  }
}
