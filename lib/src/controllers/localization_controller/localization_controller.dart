import 'dart:ui';

import 'package:get/get.dart';
import 'package:getx_template/main.dart';
import 'package:getx_template/src/config/storage_keys.dart';

class LocalizationController extends GetxController {
  late Locale _locale;

  Locale get locale => _locale;

  @override
  void onInit() {
    super.onInit();
    final languageCode = $storage.read(StorageKeys.appLanguageCode) ?? 'en';
    final countryCode = $storage.read(StorageKeys.appCountryCode) ?? 'IN';
    _locale = Locale(languageCode, countryCode);
  }

  void changeLocale(Locale? locale) {
    if (locale != null) {
      _locale = locale;
      $storage.write(StorageKeys.appLanguageCode, _locale.languageCode);
      $storage.write(StorageKeys.appCountryCode, _locale.countryCode);
      Get.updateLocale(_locale);
    }
  }
}
