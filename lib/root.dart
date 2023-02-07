import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/services/firebase_authen/auth_controller.dart';

import 'app/core/styles/style.dart';
import 'app/data/services/setting_service.dart';
import 'app/routes/app_pages.dart';

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);
  SettingService get _service => Get.find();
  AuthService get _auth => Get.find();

  @override
  Widget build(BuildContext context) {
    Get.put(SettingService());
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, Widget? child) {
        return GestureDetector(
          child: GetMaterialApp(
            showPerformanceOverlay: false,
            debugShowCheckedModeBanner: false,
            initialRoute: _auth.isAuth ? Routes.dashboard : AppPages.initial,
            getPages: AppPages.routes,
            translationsKeys: AppTranslation.translations,
            locale: Locale(_service.locale),
            routingCallback: (_) {
              WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            },
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(
                data: data.copyWith(textScaleFactor: 1.1),
                child: child!,
              );
            },
            onInit: () {
              Get.rootController.theme = AppTheme.getCollectionTheme();
              Get.rootController.darkTheme = AppTheme.getDarkTheme();
              Get.rootController.themeMode = _service.themeMode;
            },
          ),
          onTap: () {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          },
        );
      },
    );
  }
}
