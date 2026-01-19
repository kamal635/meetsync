import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetsync/src/core/constants/app_strings.dart';
import 'package:meetsync/src/core/theme/app_typography.dart';

/// A row widget that allows switching between authentication modes
class AuthSwitchModeRow extends StatelessWidget {
  /// Constructor
  const AuthSwitchModeRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AuthStrings.noAccount,
          style: AppTextStyles.bodyMedium(
            color: cs.onSurfaceVariant,
          ),
        ),
        SizedBox(width: 6.w),
        TextButton(
          onPressed: () {},
          child: const Text(AuthStrings.createOne),
        ),
      ],
    );
  }
}
