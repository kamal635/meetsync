/// Contains application string constants.
final class AppStrings {
  AppStrings._();
}

/// Authentication related string constants.
final class AuthStrings {
  AuthStrings._();

  /// The name of the application.
  static const appName = 'MeetSync';

  /// Welcome back message shown on sign-in page.
  static const welcomeBack = 'Welcome back';

  /// Subtitle prompting users to sign in.
  static const signInToContinue = 'Sign in to continue to MeetSync';

  /// Title for the sign-in form.
  static const signInTitle = 'Sign in';

  /// Subtitle for the sign-in form.
  static const signInSubtitle = 'Use your email and password.';

  /// Label for the email input field.
  static const emailLabel = 'Email';

  /// Hint text for the email input field.
  static const emailHint = 'name@example.com';

  /// Label for the password input field.
  static const passwordLabel = 'Password';

  /// Hint text for the password input field.
  static const passwordHint = 'Your password';

  /// Text for the "Remember me" option.
  static const rememberMe = 'Remember me';

  /// Text for the "Forgot password?" link.
  static const forgotPassword = 'Forgot password?';

  /// Text for the sign-in button.
  static const signInButton = 'Sign in';

  /// Text for the alternative sign-in option.
  static const or = 'or';

  /// Text for the Google sign-in button.
  static const continueWithGoogle = 'Continue with Google';

  /// Text prompting users to create an account.
  static const noAccount = "Don't have an account?";

  /// Text for the "Create one" link.
  static const createOne = 'Create one';

  /// Terms and privacy policy agreement text.
  static const terms =
      'By continuing, you agree to our Terms & Privacy Policy.';

  /// Error message when email is required.
  static const emailRequired = 'Email is required';

  /// Error message when email format is invalid.
  static const emailInvalid = 'Enter a valid email';

  /// Error message when password is required.
  static const passwordRequired = 'Password is required';

  /// Error message when password is too short.
  static const passwordMin = 'Password must be at least 6 characters';
}
