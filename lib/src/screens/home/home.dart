import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/src/config/app_constants.dart';
import 'package:getx_template/src/controllers/controllers.dart';
import 'package:getx_template/src/l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _init();
    // _checkForUpdates();
  }

  void _init() {
    // $locator.get<ConnectivityCubit>().stream.listen((_) {
    //   late String message;
    //   if (!$locator.get<ConnectivityCubit>().isConnected) {
    //     message = "Ohh!, You have gone offline";
    //   } else {
    //     message = "Connected to internet";
    //   }
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(message),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName),
        actions: [
          UnconstrainedBox(
            child: PopupMenuButton<Locale>(
              itemBuilder: (_) =>
                  AppLocalizations.supportedLocales.map((locale) {
                return PopupMenuItem<Locale>(
                  value: locale,
                  child: Text(locale.toLanguageTag().toUpperCase()),
                );
              }).toList(),
              onSelected: Get.find<LocalizationController>().changeLocale,
              icon: const Icon(Icons.language_rounded),
            ),
          ),
          UnconstrainedBox(
            child: IconButton(
              onPressed: Get.find<ThemeController>().changeTheme,
              icon: const Icon(Icons.palette_outlined),
            ),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Hi There,\n"
                  "This is the template app. "
                  "The main purpose to create this app is this is feature rich template. No more efforts for new projects. "
                  "Supports Theming (Light mode, Dark mode), Internationalization, Internet checker, Local notifications,"
                  " Firebase Services (Firebase Analytics, Firebase Remote Config, Firebase Messaging and Firebase Dynamic Links) .\n\n"
                  "Which includes -\n"
                  "1. GoRouter for Navigation\n"
                  "2. Bloc and Hydrated Bloc for State management and Storing data\n"
                  "3. Google Fonts\n"
                  "4. Formz for Form Validation (Bloc + Formz)\n"
                  "5. Freezed for Model class and Bloc generation\n"
                  "6. Firebase"
                  "Have a look at counters page below\n",
                ),
              ),
              TextButton(
                onPressed: () => Get.toNamed(AppRoutes.counters.path),
                child: Text(AppLocalizations.of(context)!.goToCountersPage),
              ),
              // TextButton(
              //   onPressed: _showLicences,
              //   child: Text(AppLocalizations.of(context)!.licences),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  /// Method to check for latest updates
  // void _checkForUpdates() async {
  //   await AppConfig.config.fetchAndActivate();
  //   final packageInfo = await PackageInfo.fromPlatform();
  //   final remoteVersion =
  //       AppConfig.config.getString(StorageKeys.enforcedVersion);
  //   final appVersion = packageInfo.version;
  //   if (remoteVersion != appVersion && mounted) {
  //     showDialog(
  //       context: context,
  //       builder: (_) {
  //         return AlertDialog(
  //           content: Text(
  //             AppLocalizations.of(context)!.updateMessage(
  //               appVersion,
  //               remoteVersion,
  //             ),
  //           ),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.of(context).pop(),
  //               child: Text(AppLocalizations.of(context)!.close),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  /// Method to show licences
  // void _showLicences() async {
  //   final packageInfo = await PackageInfo.fromPlatform();
  //   showLicensePage(
  //     context: context,
  //     applicationIcon: Assets.icons.appIcon.image(
  //       height: 100,
  //     ),
  //     applicationName: kAppName,
  //     applicationVersion: packageInfo.version,
  //   );
  // }
}
