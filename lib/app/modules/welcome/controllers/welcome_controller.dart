import 'package:get/get.dart';
import 'package:todo_app/app/core/styles/style.dart';
import 'package:todo_app/app/routes/app_pages.dart';

import '../../../core/utilities/image.dart';
import '../../../data/models/welcome/welcome_model.dart';

class WelcomeController extends GetxController {
  List<WelcomeModel> listWelcomePage = [
    WelcomeModel(AppImage.welcome1, 'Manage your tasks',
        'You can easily manage all of your daily tasks in DoMe for free'),
    WelcomeModel(AppImage.welcome2, 'Create daily routine',
        'In Uptodo  you can create your personalized routine to stay productive'),
    WelcomeModel(AppImage.welcome3, 'Orgonaize your tasks',
        'You can organize your daily tasks by adding your tasks into separate categories'),
  ];
  final pageImageController = PageController(initialPage: 0);
  final pageTextController = PageController(initialPage: 0);
  final isActiveIndex = false.obs;
  final _curentIndex = 0.obs;
  int get curentIndex => _curentIndex.value;

  void onPageChanged(int index) {
    _curentIndex(index);
    pageTextController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void onSkip() {
    pageImageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void getNext() {
    if (curentIndex != 2) {
      _curentIndex(curentIndex + 1);
      pageImageController.animateToPage(
        curentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Get.toNamed(Routes.startScreen);
    }
  }

  void getBack() {
    if (curentIndex != 0) {
      _curentIndex(curentIndex - 1);
      pageImageController.animateToPage(
        curentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
}
