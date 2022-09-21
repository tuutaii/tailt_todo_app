import 'package:get/get.dart';
import 'package:todo_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    await .5.delay();
    Get.offAndToNamed(Routes.welcome);
  }
}
