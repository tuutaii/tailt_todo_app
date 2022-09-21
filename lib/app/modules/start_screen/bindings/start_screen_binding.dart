import 'package:get/get.dart';

import '../controllers/start_screen_controller.dart';

class StartScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartScreenController>(
      () => StartScreenController(),
    );
  }
}
