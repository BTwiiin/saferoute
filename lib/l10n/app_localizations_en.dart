// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'SafeRoute';

  @override
  String get homeGreeting => 'Hello!';

  @override
  String get homeDescription => 'Welcome to SafeRoute.';

  @override
  String get changeLanguage => 'Change language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageRussian => 'Russian';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get loginSubtitle => 'Sign in to continue safely';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get orContinueWith => 'or continue with';

  @override
  String get noAccountPrompt => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign up';

  @override
  String get createAccountTitle => 'Create your account';

  @override
  String get createAccountSubtitle => 'Join SafeRoute and travel safer';

  @override
  String get orSignUpWith => 'or sign up with';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get signIn => 'Sign in';

  @override
  String get createAccount => 'Create Account';

  @override
  String get registrationSuccess =>
      'Registration successful. Please confirm your email, then sign in.';

  @override
  String get nameLabel => 'Name';

  @override
  String get nameRequired => 'Please enter your name';

  @override
  String get confirmPasswordLabel => 'Confirm Password';

  @override
  String get confirmPasswordRequired => 'Please confirm password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailRequired => 'Please enter your email';

  @override
  String get emailInvalid => 'Invalid email address';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordRequired => 'Please enter your password';

  @override
  String get passwordTooShort => 'Password too short';

  @override
  String get appleNotSupported => 'Apple sign-in is not supported yet.';

  @override
  String get mapPlaceholder => 'MAP GOES HERE';

  @override
  String get safetyScore => 'Safety Score';

  @override
  String get alerts => 'Alerts';

  @override
  String get weather => 'Weather';

  @override
  String get weatherLow => 'Low';

  @override
  String get startSafeNavigation => 'Start Safe Navigation';

  @override
  String get navHome => 'Home';

  @override
  String get navRoutes => 'Routes';

  @override
  String get navAlerts => 'Alerts';

  @override
  String get navProfile => 'Profile';
}
