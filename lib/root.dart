import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/core/styles/style.dart';
import 'app/routes/app_pages.dart';

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            theme: AppTheme.getCollectionTheme(),
            themeMode: ThemeMode.dark,
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
            routingCallback: (_) {
              WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            },
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData data = MediaQuery.of(context);
              // final textScaleFactor =
              //     data.textScaleFactor > 1.4 ? 1.4 : data.textScaleFactor;
              return MediaQuery(
                data: data.copyWith(textScaleFactor: 1.1),
                child: child!,
              );
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
