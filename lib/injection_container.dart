import 'package:get/get.dart';
import 'package:getx_template/src/controllers/controllers.dart';

void initializeDependency() {
  Get.put<ThemeController>(ThemeController());
  Get.put<LocalizationController>(LocalizationController());
}
