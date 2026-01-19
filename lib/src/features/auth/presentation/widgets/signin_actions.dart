import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetsync/src/core/constants/app_assets.dart';
import 'package:meetsync/src/core/constants/app_strings.dart';
import 'package:meetsync/src/core/ui/widgets/gradient_button.dart';
import 'package:meetsync/src/core/ui/widgets/or_divider.dart';

/// A widget that contains the sign-in action buttons
class SignInActions extends StatelessWidget {
  /// Constructor
  const SignInActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GradientButton(
          label: AuthStrings.signInButton,
          onPressed: () {},
          icon: Icons.login_rounded,
        ),

        SizedBox(height: 12.h),

        const OrDivider(),

        SizedBox(height: 12.h),

        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          icon: Image.asset(AppAssets.google, width: 20.w, height: 20.h),
          label: const Text(AuthStrings.continueWithGoogle),
        ),
      ],
    );
  }
}
