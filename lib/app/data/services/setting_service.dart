import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:get/get.dart';

class SettingService extends GetxService {
  StreamSubscription? _subscription;
  final connectStream = false.obs;
  bool get isConnect => connectStream.value;

  @override
  void onInit() {
    checkConnect();
    super.onInit();
  }

  void checkConnect() async {
    final result = await Connectivity().checkConnectivity();
    connectStream.value = result != ConnectivityResult.none;
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      connectStream.value = event != ConnectivityResult.none;
    });
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}
