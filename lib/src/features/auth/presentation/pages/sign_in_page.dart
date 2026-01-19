import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetsync/src/core/constants/app_strings.dart';
import 'package:meetsync/src/core/theme/app_typography.dart';
import 'package:meetsync/src/core/ui/widgets/glass_card.dart';
import 'package:meetsync/src/features/auth/presentation/widgets/z_export.dart';

/// The Sign In Page
class SignInPage extends StatelessWidget {
  /// Constructor
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: AuthBackground(
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 520.w),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),

                    const SignInHeader(),

                    SizedBox(height: 18.h),

                    GlassCard(
                      padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 14.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SignInCardHeader(),

                          SizedBox(height: 18.h),

                          const SignInFormFields(),

                          SizedBox(height: 12.h),

                          const SignInOptionsRow(),

                          SizedBox(height: 10.h),

                          const SignInActions(),

                          SizedBox(height: 14.h),

                          const AuthSwitchModeRow(),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.h),

                    Text(
                      AuthStrings.terms,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.labelSmall(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 22.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
