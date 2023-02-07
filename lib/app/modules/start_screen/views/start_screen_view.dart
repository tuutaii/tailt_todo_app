import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/app/core/styles/style.dart';
import 'package:todo_app/app/core/utilities/string.dart';
import 'package:todo_app/app/routes/app_pages.dart';
import 'package:todo_app/app/widget/common/app_button.dart';

import '../controllers/start_screen_controller.dart';

class StartScreenView extends GetView<StartScreenController> {
  const StartScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: context.surface),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 58.h),
        child: Column(
          children: [
            Lottie.asset(
              'assets/lotties/hello_spalsh.json',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
              repeat: false,
              frameRate: FrameRate.max,
            ),
            Text(
              '${StringUtils.welcome} UpTodo',
              style: context.subtitle1.copyWith(
                fontSize: 25.sp,
                color: context.surface,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 26.h),
            Text(
              LocaleKeys.contentWelcome.tr,
              style: context.subtitle1,
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
              LocaleKeys.loginButton.tr,
              onPressed: () => Get.toNamed(Routes.login),
              axisSize: MainAxisSize.max,
            ),
            SizedBox(
              height: 28.h,
            ),
            AppButton(
              LocaleKeys.createAccount.tr,
              onPressed: () => Get.toNamed(Routes.register),
              textColor: context.surface,
              axisSize: MainAxisSize.max,
              type: ButtonType.outline,
            ),
          ],
        ),
      ),
    );
  }
}
