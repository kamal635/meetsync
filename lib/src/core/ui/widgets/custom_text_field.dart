import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetsync/src/core/theme/app_typography.dart';

/// A customizable text form field widget
class CustomTextFormField extends StatelessWidget {
  /// Constructor
  const CustomTextFormField({
    required this.label,
    required this.hint,
    super.key,
    this.prefixIcon,
    this.suffix,
    this.obscureText = false,
  });

  /// The label text
  final String label;

  /// The hint text
  final String hint;

  /// The prefix icon data
  final IconData? prefixIcon;

  /// The suffix widget
  final Widget? suffix;

  /// Whether to obscure the text
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.labelLarge(color: cs.onSurface)),
        SizedBox(height: 8.h),
        TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon == null
                ? null
                : Icon(prefixIcon, size: 20.r),
            suffixIcon: suffix,
            filled: true,
            fillColor: cs.surfaceContainerHighest.withValues(alpha: 0.55),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 14.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: cs.outlineVariant.withValues(alpha: 0.55),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: cs.outlineVariant.withValues(alpha: 0.55),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: cs.primary.withValues(alpha: 0.9),
                width: 1.3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
