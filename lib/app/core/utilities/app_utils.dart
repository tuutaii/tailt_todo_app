import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  factory AppUtils() => _instance;
  AppUtils._internal();

  static final AppUtils _instance = AppUtils._internal();
  // static void log(dynamic msg, {String? tag}) {
  //   if (kDebugMode) {
  //     developer.log(msg.toString(), name: tag ?? AppConfig.instance.appName);
  //   }
  // }

  static void toast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: const Color(0xFF1E1E1E).withOpacity(0.95),
      textColor: Colors.white,
    );
  }
}
