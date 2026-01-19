import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetsync/src/core/constants/app_strings.dart';
import 'package:meetsync/src/core/ui/widgets/custom_text_field.dart';

/// A widget that contains the sign-in form fields
class SignInFormFields extends StatelessWidget {
  /// Constructor
  const SignInFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(
          label: AuthStrings.emailLabel,
          hint: AuthStrings.emailHint,
          prefixIcon: Icons.mail_outline_rounded,
        ),
        SizedBox(height: 14.h),

        CustomTextFormField(
          label: AuthStrings.passwordLabel,
          hint: AuthStrings.passwordHint,
          prefixIcon: Icons.lock_outline_rounded,
          obscureText: true,
          suffix: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.visibility_outlined,
            ),
          ),
        ),
      ],
    );
  }
}
