import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/modules/calendar/views/calendar_view.dart';
import 'package:todo_app/app/modules/focuse/views/focuse_view.dart';
import 'package:todo_app/app/modules/index/views/index_view.dart';
import 'package:todo_app/app/modules/profile/views/profile_view.dart';

import '../../../core/styles/style.dart';
import '../../../widget/common/keep_alive_wrapper.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          KeepAliveWrapper(
            child: IndexView(),
          ),
          KeepAliveWrapper(
            child: CalendarView(),
          ),
          KeepAliveWrapper(
            child: FocuseView(),
          ),
          KeepAliveWrapper(
            child: ProfileView(),
          ),
        ],
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
