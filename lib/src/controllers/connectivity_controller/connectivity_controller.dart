import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  final Rx<ConnectivityResult> _connectivityResult =
      ConnectivityResult.none.obs;

  ConnectivityResult get connectivityResult => _connectivityResult.value;

  ConnectivityController() {
    _connectivity.checkConnectivity().then(_result);
    _connectivity.onConnectivityChanged.listen(_result);
  }

  void _result(ConnectivityResult result) {
    _connectivityResult.value = result;
  }

  bool get isConnected =>
      connectivityResult == ConnectivityResult.ethernet ||
      connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.mobile;
}
