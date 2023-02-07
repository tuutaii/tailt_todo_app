import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/core/styles/style.dart';
import 'package:todo_app/app/modules/profile/widgets/main_drawer.dart';
import 'package:todo_app/app/widget/common/app_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.profile.tr),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileHeader(),
              SizedBox(height: 30.h),
              Text(
                LocaleKeys.setting.tr,
                style: context.bodyText1.copyWith(
                  color: AppTheme.subtitleColor,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  size: 30,
                ),
                title: Text(
                  LocaleKeys.appSetting.tr,
                  style: context.subtitle1,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
                onTap: controller.openDrawer,
              ),
              SizedBox(height: 16.h),
              Text(
                LocaleKeys.account.tr,
                style: context.bodyText1.copyWith(
                  color: AppTheme.subtitleColor,
                ),
              ),
              ListTile(
                leading: const Icon(
                  CupertinoIcons.person,
                  size: 30,
                ),
                title: Text(
                  LocaleKeys.changeName.tr,
                  style: context.subtitle1,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                leading: const Icon(
                  CupertinoIcons.lock_shield_fill,
                  size: 30,
                ),
                title: Text(
                  LocaleKeys.pass.tr,
                  style: context.subtitle1,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                leading: const Icon(
                  CupertinoIcons.camera_on_rectangle,
                  size: 30,
                ),
                title: Text(
                  LocaleKeys.changeImage.tr,
                  style: context.subtitle1,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_sharp,
                  size: 30,
                  color: context.error,
                ),
                title: Text(
                  LocaleKeys.logout.tr,
                  style: context.subtitle1.copyWith(
                    color: context.error,
                  ),
                ),
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
                onTap: controller.onLogout,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 42.5,
          backgroundImage: NetworkImage(
            'https://s1.o7planning.com/en/12997/images/64425712.png',
          ),
          backgroundColor: Colors.transparent,
        ),
        const Text('Username'),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              '10 ${LocaleKeys.taskLeft.tr}',
              onPressed: () {},
            ),
            SizedBox(width: 20.w),
            AppButton(
              '10 ${LocaleKeys.taskDone.tr}',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
