import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/core/utilities/preferences.dart';
import 'package:todo_app/app/data/services/firebase_authen/auth_controller.dart';

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
  await Preferences.setPreferences();
  await Firebase.initializeApp();
  // await NotificationService.initialNotification();
  Get.put(AuthService());
  Get.log('All services started...');
}

Future<void> main() async {
  await initServices();
  runApp(const RootApp());
}
