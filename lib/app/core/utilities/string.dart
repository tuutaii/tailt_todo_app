import 'package:get/get.dart';

class StringUtils {
  factory StringUtils() => _instance;
  StringUtils._internal();
  static final StringUtils _instance = StringUtils._internal();

  static const String notoSans = 'NotoSans';
  static const String avenir = 'Avenir';

  // Common
  static String get error => 'error'.tr;
  static String get cancel => 'cancel'.tr;
  static String get ok => 'ok'.tr;
  static String get close => 'close'.tr;
  static String get emptyId => 'Id is required';
  static String get inputIncorrect => 'input_incorrect'.tr;
  static String get emptyPassword => 'Password is required';
  static String get password => 'password'.tr;
  static String get singUp => 'sign_up'.tr;
  static String get name => 'name'.tr;
  static String get dob => 'dob'.tr;
  static String get phone => 'phone'.tr;
  static String get email => 'email'.tr;
  static String get register => 'register'.tr;
  static String get registerNote => 'register_note'.tr;
  static String get pleaseCheckYourNetwork => 'Please check your network';
  static String get noData => 'no_data'.tr;
  static String get tokenTimeout => 'token_timeout'.tr;
  static String get goToLogin => 'go_to_login'.tr;
  static String get achieved => 'achieved'.tr;
  static String get dataQueryError => 'data_query_error'.tr;
  static String get dataChangeError => 'data_change_error'.tr;
  static String get unknownError => 'unknown_error'.tr;

  static String get logout => 'logout'.tr;

  static String get messageInput => 'message_input'.tr;
}
