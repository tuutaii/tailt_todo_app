import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardView'),
        centerTitle: true,
      ),
      body: PageView(
        controller: PageController(initialPage: 0),
        physics: const NeverScrollableScrollPhysics(),
        children: [],
      ),
      bottomNavigationBar: const _BottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButton(
        elevation: 0,
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}

class _BottomNavigationBar extends GetView<DashboardController> {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.dividerColor,
      child: SafeArea(
          child: Row(
        children: const [
          _BottomNavItem(
            index: 0,
          ),
          _BottomNavItem(
            index: 1,
          ),
          Expanded(
            child: Text(''),
          ),
          _BottomNavItem(
            index: 2,
          ),
          _BottomNavItem(
            index: 3,
          )
        ],
      )),
    );
  }
}

class _BottomNavItem extends GetView<DashboardController> {
  const _BottomNavItem({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final item = controller.bottoms.elementAt(index);
    return Expanded(
      child: MaterialButton(
        onPressed: () => controller.onChangeTab(index),
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Obx(
          () {
            final active = controller.currentIndex.value == index;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 5.h),
                SvgPicture.asset(
                  item.icon,
                  width: 24.w,
                  height: 24.h,
                  color: active ? context.primary : context.onBackground,
                ),
                SizedBox(height: 5.h),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: context.caption.copyWith(
                    color: active ? context.primary : context.onBackground,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
