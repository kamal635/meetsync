import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetsync/src/core/constants/app_strings.dart';
import 'package:meetsync/src/core/theme/app_typography.dart';

/// A header widget for the sign-in card
class SignInCardHeader extends StatelessWidget {
  /// Constructor
  const SignInCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AuthStrings.signInTitle,
          style: AppTextStyles.titleLarge(
            color: cs.onSurface,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          AuthStrings.signInSubtitle,
          style: AppTextStyles.bodyMedium(
            color: cs.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
