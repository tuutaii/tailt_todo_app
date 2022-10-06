import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/core/styles/style.dart';
import 'package:todo_app/app/widget/common/app_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileHeader(),
              SizedBox(height: 30.h),
              Text(
                'Setitngs',
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
                  'App Settings',
                  style: context.subtitle1,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
              ),
              SizedBox(height: 16.h),
              Text(
                'Accounts',
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
                  'Change username',
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
                  'Change password',
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
                  'Change Image',
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
                  'Log out',
                  style: context.subtitle1.copyWith(
                    color: context.error,
                  ),
                ),
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
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
              '10 Task left',
              onPressed: () {},
            ),
            SizedBox(width: 20.w),
            AppButton(
              '10 Task left',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
