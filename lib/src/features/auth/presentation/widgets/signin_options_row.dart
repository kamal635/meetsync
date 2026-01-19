import 'package:flutter/material.dart';
import 'package:meetsync/src/core/constants/app_strings.dart';
import 'package:meetsync/src/core/theme/app_typography.dart';

/// A row widget that contains sign-in options like
///  "Remember Me" and "Forgot Password"
class SignInOptionsRow extends StatelessWidget {
  /// Constructor
  const SignInOptionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (_) {},
        ),
        Text(
          AuthStrings.rememberMe,
          style: AppTextStyles.bodyMedium(
            color: cs.onSurface,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            AuthStrings.forgotPassword,
            style: TextStyle(color: cs.primary),
          ),
        ),
      ],
    );
  }
}
