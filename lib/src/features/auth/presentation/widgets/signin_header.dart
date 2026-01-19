import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetsync/src/core/constants/app_strings.dart';
import 'package:meetsync/src/core/theme/app_typography.dart';

/// A header widget for the sign-in screen
class SignInHeader extends StatelessWidget {
  /// Constructor
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      children: [
        // Brand pill
        const _BrandPill(title: AuthStrings.appName),
        SizedBox(height: 16.h),

        Text(
          AuthStrings.welcomeBack,
          textAlign: TextAlign.center,
          style: AppTextStyles.headlineLarge(color: cs.onSurface),
        ),
        SizedBox(height: 6.h),

        Text(
          AuthStrings.signInToContinue,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium(
            color: cs.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _BrandPill extends StatelessWidget {
  const _BrandPill({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: cs.primary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999.r),
        border: Border.all(color: cs.primary.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.flash_on_rounded, color: cs.primary),
          SizedBox(width: 8.w),
          Text(
            title,
            style: AppTextStyles.labelLarge(color: cs.primary),
          ),
        ],
      ),
    );
  }
}
