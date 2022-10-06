class AppImage {
  factory AppImage() => _instance;

  AppImage._internal();
  static final AppImage _instance = AppImage._internal();

  static const String logo = 'assets/images/logo.png';
  static const String welcome1 = 'assets/images/welcome1.png';
  static const String welcome2 = 'assets/images/welcome2.png';
  static const String welcome3 = 'assets/images/welcome3.png';
  static const String indexImage = 'assets/images/index_screen_image.png';
  static const String userAvt = 'assets/images/user.png';
  //icon
  static const String apple = 'assets/images/appleIcon.png';
  static const String google = 'assets/images/googleIcon.png';
  static const String home = 'assets/icons/home.svg';
  static const String calendar = 'assets/icons/calendar.svg';
  static const String clock = 'assets/icons/clock.svg';
  static const String user = 'assets/icons/user.svg';
  static const String sort = 'assets/icons/sort.svg';
  static const String timer = 'assets/icons/timer.svg';
  static const String tag = 'assets/icons/tag.svg';
  static const String flag = 'assets/icons/flag.svg';
  static const String send = 'assets/icons/send.svg';
  static const String edit = 'assets/icons/edit.svg';
}
