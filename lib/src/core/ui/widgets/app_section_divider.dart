import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetsync/src/core/theme/app_typography.dart';

/// A section divider widget with a label in the center.
class AppSectionDivider extends StatelessWidget {
  /// Creates an instance of [AppSectionDivider].
  const AppSectionDivider({required this.label, super.key});

  /// The label displayed in the center of the divider.
  final String label;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(child: Divider(color: cs.outlineVariant)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            label,
            style: AppTextStyles.labelSmall(color: cs.onSurfaceVariant),
          ),
        ),
        Expanded(child: Divider(color: cs.outlineVariant)),
      ],
    );
  }
}
