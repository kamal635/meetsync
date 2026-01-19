import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A primary button widget for the app.
class AppPrimaryButton extends StatelessWidget {
  /// Creates an instance of [AppPrimaryButton].
  const AppPrimaryButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.isLoading = false,
  });

  /// The label of the button.
  final String label;

  /// The callback when the button is pressed.
  final VoidCallback? onPressed;

  /// Indicates whether the button is in a loading state.
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: isLoading
          ? SizedBox(
              height: 18.r,
              width: 18.r,
              child: const CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(label),
    );
  }
}
