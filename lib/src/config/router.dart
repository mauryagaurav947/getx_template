import 'package:get/get.dart';
import 'package:getx_template/main.dart';
import 'package:getx_template/src/config/app_constants.dart';
import 'package:getx_template/src/config/storage_keys.dart';
import 'package:getx_template/src/screens/auth/sign_in/sign_in.dart';
import 'package:getx_template/src/screens/counter_page/counter_page.dart';
import 'package:getx_template/src/screens/home/home.dart';
import 'package:getx_template/src/screens/on_boarding_screen/on_boarding_screen.dart';

class AppRouter {
  static List<GetPage> get pages => [
        GetPage(
          name: '/',
          page: () {
            final shownSplashScreen =
                $storage.read(StorageKeys.shownOnBoardingScreen);
            if (shownSplashScreen == true) {
              return const SignIn();
            } else {
              return const OnBoardingPage();
            }
          },
        ),
        GetPage(
          name: AppRoutes.counters.path,
          page: () => const CounterPage(),
        ),
        GetPage(
          name: AppRoutes.login.path,
          page: () => const SignIn(),
        ),
        GetPage(
          name: AppRoutes.home.path,
          page: () => const HomePage(),
        ),
      ];
}
