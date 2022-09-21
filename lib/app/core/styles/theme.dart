part of style;

class AppTheme {
  AppTheme._();

  factory AppTheme() => _instance;

  static final AppTheme _instance = AppTheme._();
  static const Color primary = Color(0xFF8875FF);
  static const Color inputPlaceholder = Color(0xffF5FBFF);
  static const Color secondaryColor = Color(0xff00BA9C);
  static const Color subtitleColor = Color(0xff888888);
  static const Color processColor = Color(0xffBD631F);
  static const Color background = Color(0xff252525);
  static const Color onBackground = Colors.white;
  static const Color surface = Color(0xff121212);
  static const Color error = Color(0xffBE2727);
  static const Color dividerColor = Color(0xff979797);
  static const Color filled = Color(0xff1D1D1D);

  static ThemeData getCollectionTheme() {
    const colorScheme = ColorScheme.dark(
      primary: primary,
      secondary: Colors.black,
      surface: surface,
      background: background,
      error: error,
    );

    final themeData = ThemeData(
        fontFamily: 'domine_variableFont',
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.background,
        ),
        brightness: colorScheme.brightness,
        primaryColor: colorScheme.primary,
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.background,
        bottomAppBarColor: colorScheme.surface,
        cardColor: colorScheme.surface,
        dividerColor: colorScheme.onSurface.withOpacity(0.12),
        backgroundColor: colorScheme.background,
        dialogBackgroundColor: colorScheme.surface,
        errorColor: colorScheme.error,
        indicatorColor: colorScheme.onSurface,
        applyElevationOverlayColor: true,
        dividerTheme: const DividerThemeData(color: dividerColor),
        colorScheme: colorScheme,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          },
        ));
    final textTheme = themeData.textTheme;
    return themeData.copyWith(
      textTheme: themeData.textTheme.copyWith(
        button: textTheme.button!.copyWith(
          fontSize: 14.sp,
          height: 1.2,
        ),
        bodyText1: textTheme.bodyText1!.copyWith(
          height: 1.2,
          letterSpacing: 0.02,
          fontSize: 14.sp,
        ),
        bodyText2: textTheme.bodyText2!.copyWith(
          height: 1.2,
          letterSpacing: 0.02,
          fontSize: 14.sp,
        ),
        subtitle1: textTheme.subtitle1!.copyWith(
          height: 1.2,
          letterSpacing: 0.02,
          fontSize: 16.sp,
        ),
        subtitle2: textTheme.subtitle2!.copyWith(
          height: 1.2,
          letterSpacing: 0.02,
          fontSize: 16.sp,
        ),
        caption: textTheme.caption!.copyWith(
          height: 1.2,
          letterSpacing: 0.02,
          fontSize: 12.sp,
        ),
        overline: textTheme.overline!.copyWith(
          height: 1.2,
          letterSpacing: 0.02,
          fontSize: 10.sp,
        ),
        headline6: textTheme.headline6!.copyWith(
          height: 1.2,
          letterSpacing: 0.02,
          fontSize: 20.sp,
        ),
        headline5: textTheme.headline5!.copyWith(
          height: 1.2,
          letterSpacing: 0.02,
          fontSize: 24.sp,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
