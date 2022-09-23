import 'package:get/get.dart';

import '../controllers/focuse_controller.dart';

class FocuseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FocuseController>(
      () => FocuseController(),
    );
  }
}
