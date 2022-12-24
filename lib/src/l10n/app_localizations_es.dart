import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'modelo';

  @override
  String get goToCountersPage => 'IR A LA PÁGINA DE CONTADORES';

  @override
  String get getVersion => 'OBTENER VERSIÓN';

  @override
  String get counters => 'Contadores';

  @override
  String updateMessage(String appVersion, String remoteVersion) {
    return 'Parece que no está utilizando la versión actualizada de la aplicación. Está utilizando $appVersion y la versión actual es $remoteVersion';
  }

  @override
  String get close => 'cerca';

  @override
  String get licences => 'Licencias';

  @override
  String get helloAgain => '¡Hola de nuevo!';

  @override
  String get signInWelcomeMsg => '¡Bienvenido de nuevo, se te ha echado de menos!';

  @override
  String get enterUsername => 'Introduzca su nombre de usuario';

  @override
  String get enterPassword => 'Introducir la contraseña';

  @override
  String get forgotPassword => '¿Has olvidado tu contraseña?';

  @override
  String get signIn => 'Registrarse';

  @override
  String get orContinueWith => 'o continuar con';

  @override
  String get notAMember => '¿No es un miembro?';

  @override
  String get registerNow => 'Regístrate ahora';
}
