import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/core/styles/style.dart';
import 'root.dart';

Future<void> initServices() async {
  Get.log('Starting services ...');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ),
  );

  // await Firebase.initializeApp();
  // await NotificationService.initialNotification();
  Get.log('All services started...');
}

Future<void> main() async {
  await initServices();
  runApp(const RootApp());
}
