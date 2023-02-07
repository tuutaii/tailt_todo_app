import 'package:get/get.dart';
import 'package:todo_app/app/routes/app_pages.dart';

import '../../../core/styles/style.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 700,
      ),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.offAndToNamed(Routes.welcome);
      }
    });
  }
}
