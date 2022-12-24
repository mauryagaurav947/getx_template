import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/main.dart';
import 'package:getx_template/src/config/storage_keys.dart';

class ThemeController extends GetxController {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  bool get isDark => _themeMode == ThemeMode.dark;

  @override
  void onInit() {
    super.onInit();
    print("Hello");
    final themeMode = $storage.read<String>(StorageKeys.themeMode);
    print(themeMode);
    if (themeMode != null) {
      _themeMode = ThemeMode.values.asNameMap()[themeMode]!;
    }
  }

  /// Method to change theme
  void changeTheme() async {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    await $storage.write(StorageKeys.themeMode, _themeMode.name);
    Get.changeThemeMode(_themeMode);
  }
}
