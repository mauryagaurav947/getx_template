import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/main.dart';
import 'package:getx_template/src/config/app_constants.dart';
import 'package:getx_template/src/config/storage_keys.dart';
import 'package:getx_template/src/gen/assets.gen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _items = <PageViewModel>[
    PageViewModel(
      title: 'Fractional shares',
      body:
          'Instead of having to buy an entire share,\ninvest any amount you want.',
      image: Assets.images.onboarding1.image(),
      decoration: const PageDecoration(
        imageFlex: 2,
        imagePadding: EdgeInsets.all(10),
        imageAlignment: Alignment.center,
      ),
    ),
    PageViewModel(
      title: 'Learn as you go',
      body:
          'Download the Stockpile app and master\nthe market with our mini-lesson.',
      image: Assets.images.onboarding2.image(),
      decoration: const PageDecoration(
        imageFlex: 2,
        imagePadding: EdgeInsets.all(10),
        imageAlignment: Alignment.center,
      ),
    ),
    PageViewModel(
      title: 'Kids and teens',
      body:
          'Kids and teens can track their stocks\n24/7 and place trades that you approve.',
      image: Assets.images.onboarding3.image(),
      decoration: const PageDecoration(
        imageFlex: 2,
        imagePadding: EdgeInsets.all(10),
        imageAlignment: Alignment.center,
      ),
    ),
  ];

  final GlobalKey<IntroductionScreenState> _key =
      GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        key: _key,
        pages: _items,
        controlsPadding: const EdgeInsets.symmetric(horizontal: 5),
        dotsFlex: 3,
        isBottomSafeArea: true,
        showSkipButton: true,
        dotsDecorator: DotsDecorator(
          activeColor: Theme.of(context).indicatorColor,
          color: Theme.of(context).disabledColor,
        ),
        overrideDone: TextButton(
          onPressed: _onDone,
          child: const Text('Done'),
        ),
        overrideNext: TextButton(
          child: const Text('Next'),
          onPressed: () => _key.currentState!.next(),
        ),
        overrideSkip: TextButton(
          child: const Text('Skip'),
          onPressed: () => _key.currentState!.skipToEnd(),
        ),
      ),
    );
  }

  void _onDone() async {
    await $storage.write(StorageKeys.shownOnBoardingScreen, true);
    Get.offNamed(AppRoutes.login.path);
    // await HydratedBloc.storage.write(StorageKeys.shownOnBoardingScreen, true);
    // if (mounted) {
    //   context.go(AppRoutes.login.path);
    // }

    // await AppConfig.config.fetchAndActivate();
    // print(AppConfig.config.getString('enforced_version'));
  }
}
