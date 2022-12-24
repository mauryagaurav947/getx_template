import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Template';

  @override
  String get goToCountersPage => 'GO TO COUNTERS PAGE';

  @override
  String get getVersion => 'GET VERSION';

  @override
  String get counters => 'Counters';

  @override
  String updateMessage(String appVersion, String remoteVersion) {
    return 'Seems like you are not using the update version of app. You are using $appVersion and the current version is $remoteVersion';
  }

  @override
  String get close => 'Close';

  @override
  String get licences => 'Licences';

  @override
  String get helloAgain => 'Hello Again!';

  @override
  String get signInWelcomeMsg => 'Welcome back you\'ve\nbeen missed!';

  @override
  String get enterUsername => 'Enter Username';

  @override
  String get enterPassword => 'Enter Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get signIn => 'Sign In';

  @override
  String get orContinueWith => 'Or continue with';

  @override
  String get notAMember => 'Not a member?';

  @override
  String get registerNow => 'Register Now';
}
