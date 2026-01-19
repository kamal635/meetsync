import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetsync/src/core/theme/app_colors.dart';
import 'package:meetsync/src/core/theme/app_layout.dart';
import 'package:meetsync/src/core/theme/app_typography.dart';
import 'package:meetsync/src/features/auth/presentation/pages/sign_in_page.dart';

/// Reads the current device logical size without needing a BuildContext.
Size _deviceLogicalSize() {
  final view = WidgetsBinding.instance.platformDispatcher.views.first;
  return view.physicalSize / view.devicePixelRatio;
}

/// The root widget of the MeetSync application.
class MeetSyncApp extends StatelessWidget {
  /// Creates a [MeetSyncApp] widget.
  const MeetSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.seed,
    );
    final darkColorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.seed,
      brightness: Brightness.dark,
    );

    final deviceSize = _deviceLogicalSize();
    final designSize = AppLayout.designSizeFor(deviceSize);

    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MeetSync',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: colorScheme,
            fontFamily: AppFonts.primary,
            textTheme: AppTextStyles.textTheme(colorScheme),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            fontFamily: AppFonts.primary,
            textTheme: AppTextStyles.textTheme(darkColorScheme),
          ),
          themeMode: ThemeMode.system,
          home: child,
        );
      },
      child: const SignInPage(),
    );
  }
}
