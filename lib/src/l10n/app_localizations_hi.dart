import 'app_localizations.dart';

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'टेम्पलेट';

  @override
  String get goToCountersPage => 'काउंटर पेज पर जाएं';

  @override
  String get getVersion => 'संस्करण प्राप्त करें';

  @override
  String get counters => 'काउंटर';

  @override
  String updateMessage(String appVersion, String remoteVersion) {
    return 'ऐसा लगता है कि आप ऐप के अद्यतन संस्करण का उपयोग नहीं कर रहे हैं। आप $appVersion का इस्तेमाल कर रहे हैं और मौजूदा वर्शन $remoteVersion है';
  }

  @override
  String get close => 'बंद';

  @override
  String get licences => 'लाइसेंस';

  @override
  String get helloAgain => 'फिर से हैलो!';

  @override
  String get signInWelcomeMsg => 'आपका फिर से स्वागत है\nआपको याद किया गया है!';

  @override
  String get enterUsername => 'उपयोगकर्ता नाम दर्ज करें';

  @override
  String get enterPassword => 'पासवर्ड दर्ज करें';

  @override
  String get forgotPassword => 'पासवर्ड भूल गए?';

  @override
  String get signIn => 'साइन इन करें';

  @override
  String get orContinueWith => 'या जारी रखें';

  @override
  String get notAMember => 'सदस्य नहीं हैं?';

  @override
  String get registerNow => 'अभी पंजीकरण करें';
}
