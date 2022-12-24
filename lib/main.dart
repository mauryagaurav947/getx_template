import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_template/app.dart';
import 'package:getx_template/injection_container.dart';

/// Instance of GetStorage
late GetStorage $storage;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  $storage = GetStorage();

  /// Initialize service locator
  initializeDependency();

  runApp(const MyApp());
}
