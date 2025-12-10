// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'SafeRoute';

  @override
  String get homeGreeting => 'Привет!';

  @override
  String get homeDescription => 'Добро пожаловать в SafeRoute.';

  @override
  String get changeLanguage => 'Сменить язык';

  @override
  String get languageEnglish => 'Английский';

  @override
  String get languageRussian => 'Русский';

  @override
  String get welcomeBack => 'С возвращением';

  @override
  String get loginSubtitle => 'Войдите, чтобы продолжить безопасно';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get orContinueWith => 'или войдите с';

  @override
  String get noAccountPrompt => 'Нет аккаунта?';

  @override
  String get signUp => 'Зарегистрироваться';

  @override
  String get createAccountTitle => 'Создайте аккаунт';

  @override
  String get createAccountSubtitle =>
      'Присоединяйтесь к SafeRoute и путешествуйте безопаснее';

  @override
  String get orSignUpWith => 'или зарегистрируйтесь с';

  @override
  String get alreadyHaveAccount => 'Уже есть аккаунт?';

  @override
  String get signIn => 'Войти';

  @override
  String get createAccount => 'Создать аккаунт';

  @override
  String get registrationSuccess =>
      'Регистрация успешна. Подтвердите email, затем войдите.';

  @override
  String get nameLabel => 'Имя';

  @override
  String get nameRequired => 'Пожалуйста, введите имя';

  @override
  String get confirmPasswordLabel => 'Подтвердите пароль';

  @override
  String get confirmPasswordRequired => 'Пожалуйста, подтвердите пароль';

  @override
  String get passwordsDoNotMatch => 'Пароли не совпадают';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailRequired => 'Пожалуйста, введите email';

  @override
  String get emailInvalid => 'Некорректный email';

  @override
  String get passwordLabel => 'Пароль';

  @override
  String get passwordRequired => 'Пожалуйста, введите пароль';

  @override
  String get passwordTooShort => 'Слишком короткий пароль';

  @override
  String get appleNotSupported => 'Вход через Apple пока не поддерживается.';

  @override
  String get mapPlaceholder => 'Здесь будет карта';

  @override
  String get safetyScore => 'Оценка безопасности';

  @override
  String get alerts => 'Оповещения';

  @override
  String get weather => 'Погода';

  @override
  String get weatherLow => 'Низкий';

  @override
  String get startSafeNavigation => 'Начать безопасный маршрут';

  @override
  String get navHome => 'Главная';

  @override
  String get navRoutes => 'Маршруты';

  @override
  String get navAlerts => 'Оповещения';

  @override
  String get navProfile => 'Профиль';
}
