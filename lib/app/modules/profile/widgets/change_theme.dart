import 'package:get/get.dart';
import 'package:todo_app/app/modules/profile/controllers/profile_controller.dart';

import '../../../core/styles/style.dart';

class ChangeTheme extends GetView<ProfileController> {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Text(
            LocaleKeys.changeTheme.tr,
            style: context.subtitle1,
          ),
          SizedBox(height: 5.h),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.dark_mode_outlined,
                    size: 30,
                  ),
                  title: Text(
                    'Dark mode',
                    style: context.bodyText1,
                  ),
                  trailing: Obx(
                    () => Switch.adaptive(
                      value: controller.isDarkMode.value,
                      activeColor: context.primary,
                      onChanged: (bool i) {
                        controller.onChangeThem(i);
                      },
                    ),
                  ),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
