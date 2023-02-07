import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/core/styles/style.dart';
import 'package:todo_app/app/core/utilities/preferences.dart';

class SettingService extends GetxService {
  StreamSubscription? _subscription;
  final connectStream = false.obs;
  bool get isConnect => connectStream.value;
  ThemeMode themeMode = ThemeMode.light;
  String locale = 'en';

  @override
  void onInit() {
    checkConnect();
    getTheme();
    getLanguage();
    super.onInit();
  }

  Future<void> getTheme() async {
    onChangeTheme(Preferences.pref.getBool('theme') ?? true);
  }

  Future<void> getLanguage() async {
    locale = Preferences.pref.getString('language') ?? 'en';
  }

  void onChangeTheme(bool value) {
    Get.changeTheme(
        value ? AppTheme.getDarkTheme() : AppTheme.getCollectionTheme());
    themeMode = value ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(themeMode);
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
