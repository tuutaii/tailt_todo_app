import 'package:get/get.dart';

import 'package:todo_app/app/core/utilities/image.dart';

import '../../../core/styles/style.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImage.logo,
              height: 113.h,
              width: 113.w,
            ),
            Text(
              'UpToDo',
              style: context.bodyText1.copyWith(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
