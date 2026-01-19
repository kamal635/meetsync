import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A button widget with a gradient background
class GradientButton extends StatelessWidget {
  /// Constructor
  const GradientButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.icon,
  });

  /// The label text of the button
  final String label;

  /// The callback function to execute when the button is pressed
  final VoidCallback? onPressed;

  /// An optional icon to display alongside the label
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              cs.primary,
              cs.secondary,
            ],
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 22,
              offset: const Offset(0, 10),
              color: cs.primary.withValues(alpha: 0.25),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18.r, color: cs.onPrimary),
                SizedBox(width: 8.w),
              ],
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: cs.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
