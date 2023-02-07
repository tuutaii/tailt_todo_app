import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
            Lottie.asset(
              'assets/lotties/bts_splash.json',
              width: 400,
              height: 400,
              fit: BoxFit.fill,
              frameRate: FrameRate.max,
              controller: controller.controller,
              onLoaded: (composition) {
                controller.controller
                  ..duration = composition.duration
                  ..forward();
              },
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
