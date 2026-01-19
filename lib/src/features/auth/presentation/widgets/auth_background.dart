import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A beautiful background for authentication screens
class AuthBackground extends StatelessWidget {
  /// Constructor
  const AuthBackground({required this.child, super.key});

  /// The child widget to display on top of the background
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Stack(
      children: [
        // Base gradient
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  cs.primary.withValues(alpha: 0.35),
                  cs.surface,
                  cs.tertiary.withValues(alpha: 0.22),
                ],
              ),
            ),
          ),
        ),

        // Soft blobs (aurora)
        Positioned(
          top: -120.h,
          left: -90.w,
          child: _Blob(
            size: 320.r,
            color: cs.primary.withValues(alpha: 0.25),
          ),
        ),
        Positioned(
          bottom: -140.h,
          right: -110.w,
          child: _Blob(
            size: 360.r,
            color: cs.tertiary.withValues(alpha: 0.22),
          ),
        ),
        Positioned(
          top: 120.h,
          right: -80.w,
          child: _Blob(
            size: 220.r,
            color: cs.secondary.withValues(alpha: 0.18),
          ),
        ),

        // Subtle noise-like overlay (fake by blur + opacity layer)
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 14,
              sigmaY: 14,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: cs.surface.withValues(alpha: 0.06),
              ),
            ),
          ),
        ),

        child,
      ],
    );
  }
}

class _Blob extends StatelessWidget {
  const _Blob({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
