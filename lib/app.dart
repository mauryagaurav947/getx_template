import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/src/config/app_constants.dart';
import 'package:getx_template/src/config/router.dart';
import 'package:getx_template/src/config/theme.dart';
import 'package:getx_template/src/controllers/controllers.dart';
import 'package:getx_template/src/l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: kAppName,
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      themeMode: Get.find<ThemeController>().themeMode,
      locale: Get.find<LocalizationController>().locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppRouter.pages,
    );
  }
}
