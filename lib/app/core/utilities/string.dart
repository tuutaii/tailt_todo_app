import 'package:get/get.dart';

class StringUtils {
  factory StringUtils() => _instance;
  StringUtils._internal();
  static final StringUtils _instance = StringUtils._internal();

  static const String notoSans = 'NotoSans';
  static const String avenir = 'Avenir';
  static String get emptyId => 'Id is required';

  static String get inputIncorrect => 'input_incorrect'.tr;
  static String get emptyPassword => 'Password is required';

  //--- Onboarding Screen ---
  static String get manageTasks => 'manage_tasks'.tr;
  static String get content1 => 'content_1'.tr;
  static String get createRoutine => 'create_routine'.tr;
  static String get content2 => 'content_2'.tr;
  static String get orgonaizeTasks => 'orgonaize_tasks'.tr;
  static String get content3 => 'content_3'.tr;
  static String get skip => 'skip'.tr;
  static String get back => 'back'.tr;
  static String get next => 'next'.tr;
  static String get start => 'start'.tr;
  static String get welcome => 'welcome'.tr;
  static String get contentWelcome => 'content_welcome'.tr;
  static String get loginButton => 'login_button'.tr;
  static String get createAccount => 'create_account'.tr;

  //--- Login Screen ---
  static String get loginTitle => 'login_title'.tr;
  static String get registerTitle => 'register_title'.tr;
  static String get username => 'user_name'.tr;
  static String get pass => 'pass'.tr;
  static String get or => 'or'.tr;
  static String get confirmPass => 'confirm_pass'.tr;
  static String get loginWith => 'login_with'.tr;
  static String get registerWith => 'register_with'.tr;
  static String get bottomLogin => 'bottom_login'.tr;
  static String get bottomRegister => 'bottom_register'.tr;

  //---Dashboard---
  static String get index => 'index';
  static String get calendar => 'calendar';
  static String get focuse => 'focuse';
  static String get profile => 'profile';
}
