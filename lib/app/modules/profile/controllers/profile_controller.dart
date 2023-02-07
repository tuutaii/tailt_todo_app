import 'package:get/get.dart';
import 'package:todo_app/app/data/services/firebase_authen/auth_controller.dart';
import 'package:todo_app/app/data/services/setting_service.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/preferences.dart';

class ProfileController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  SettingService get _service => Get.find();
  AuthService get _auth => Get.find();

  final isDarkMode = false.obs;
  final selectedLangguage = 0.obs;

  _saveThemeStatus() async {
    Preferences.pref.setBool('theme', isDarkMode.value);
  }

  @override
  void onInit() {
    super.onInit();
    _service.themeMode == ThemeMode.dark ? isDarkMode(true) : isDarkMode(false);
    _service.locale == 'en' ? selectedLangguage(0) : selectedLangguage(1);
  }

  void onChangeThem(bool value) {
    _service.onChangeTheme(value);
    isDarkMode.toggle();
    _saveThemeStatus();
    Get.back();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void onLogout() {
    _auth.logOut();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void onSelectedLanguage(int? value) {
    selectedLangguage(value);
  }

  void onConfirmChange() {
    switch (selectedLangguage.value) {
      case 0:
        Get.updateLocale(const Locale('en'));
        Preferences.pref.setString('language', 'en');

        break;
      case 1:
        Get.updateLocale(const Locale('vi'));
        Preferences.pref.setString('language', 'vi');
        break;
    }
    Get.back();
  }
}
