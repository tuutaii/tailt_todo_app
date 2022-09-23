import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';

class BottomNavigator {
  BottomNavigator(this.name, this.icon);
  final String icon;
  final String name;
}

enum DashboardTab { home, calendar, focuse, profile }

const initTab = DashboardTab.home;

class DashboardController extends GetxController {
  final currentIndex = initTab.index.obs;
  final bottoms = <BottomNavigator>[];
  final pageController = PageController(initialPage: initTab.index);
  @override
  void onInit() {
    bottoms
      ..add(BottomNavigator('Index', AppImage.home))
      ..add(BottomNavigator('Calendar', AppImage.calendar))
      ..add(BottomNavigator('Focuse', AppImage.clock))
      ..add(BottomNavigator('Profile', AppImage.user));
    super.onInit();
  }

  Future<void> onChangeTab(int index) async {
    pageController.jumpToPage(index);
    currentIndex(index);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
