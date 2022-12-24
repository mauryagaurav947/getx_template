import 'package:get/get.dart';

class CounterController extends GetxController {
  int get counter => obxCounter.value;
  Rx<int> obxCounter = 0.obs;

  void increment() async {
    obxCounter.value = obxCounter.value + 1;
    // update();
  }

  void decrement() async {
    obxCounter.value = obxCounter.value - 1;
    // update();
  }
}
