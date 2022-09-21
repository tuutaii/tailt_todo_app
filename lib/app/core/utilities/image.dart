class AppImage {
  factory AppImage() => _instance;

  AppImage._internal();
  static final AppImage _instance = AppImage._internal();

  static const String logo = 'assets/images/logo.png';
  static const String welcome1 = 'assets/images/welcome1.png';
  static const String welcome2 = 'assets/images/welcome2.png';
  static const String welcome3 = 'assets/images/welcome3.png';
  //icon
  static const String apple = 'assets/images/appleIcon.png';
  static const String google = 'assets/images/googleIcon.png';
  static const String home = 'assets/icons/home.svg';
  static const String calendar = 'assets/icons/calendar.svg';
  static const String clock = 'assets/icons/clock.svg';
  static const String user = 'assets/icons/user.svg';
}
