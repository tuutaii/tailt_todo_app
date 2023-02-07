import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/focuse_controller.dart';

class FocuseView extends GetView<FocuseController> {
  const FocuseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.calendar.tr),
        centerTitle: true,
      ),
      body: const Center(),
    );
  }
}
