import 'package:get/get.dart';
import 'package:todo_app/app/core/styles/style.dart';
import 'package:todo_app/app/routes/app_pages.dart';
import 'package:todo_app/app/widget/common/app_button.dart';

import '../controllers/start_screen_controller.dart';

class StartScreenView extends GetView<StartScreenController> {
  const StartScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: context.onBackground),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 58.h),
        child: Column(
          children: [
            Text(
              'Welcome to UpTodo',
              style: context.subtitle1.copyWith(
                fontSize: 25.sp,
                color: context.onBackground,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 26.h),
            Text(
              'Please login to your account or create new account to continue',
              style: context.subtitle1.copyWith(color: AppTheme.subtitleColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: context.mediaQueryViewPadding.bottom,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              'LOGIN',
              onPressed: () => Get.toNamed(Routes.login),
              axisSize: MainAxisSize.max,
            ),
            SizedBox(
              height: 28.h,
            ),
            AppButton(
              'CREATE ACCOUNT',
              onPressed: () => Get.toNamed(Routes.register),
              axisSize: MainAxisSize.max,
              type: ButtonType.outline,
            ),
          ],
        ),
      ),
    );
  }
}
