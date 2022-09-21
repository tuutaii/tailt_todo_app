import 'package:get/get.dart';
import 'package:todo_app/app/widget/common/app_button.dart';

import '../../../core/styles/style.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: TextButton(
            onPressed: controller.onSkip,
            child: Text(
              'SKIP',
              style: context.subtitle1.copyWith(
                color: AppTheme.subtitleColor,
              ),
            ),
          ),
        ),
        leadingWidth: 100,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300.h,
            child: PageView.builder(
              itemCount: controller.listWelcomePage.length,
              controller: controller.pageImageController,
              itemBuilder: (_, int index) {
                return Image.asset(
                  controller.listWelcomePage[index].pngimage,
                );
              },
              onPageChanged: controller.onPageChanged,
            ),
          ),
          Obx(
            () => SizedBox(
              height: 50.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  3,
                  ((index) =>
                      _indicatorBuilder(index == controller.curentIndex)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 10.h),
            child: SizedBox(
              height: 200.h,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.listWelcomePage.length,
                controller: controller.pageTextController,
                itemBuilder: (_, int index) {
                  return Column(
                    children: [
                      Text(
                        controller.listWelcomePage[index].title,
                        style: context.subtitle1.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 42.h),
                      Text(
                        controller.listWelcomePage[index].discription,
                        style: context.captionStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => _BottomButton(
          canBack: controller.curentIndex != 0,
          isLast: controller.curentIndex == 2,
          onBack: controller.getBack,
          onNext: controller.getNext,
        ),
      ),
    );
  }

  Widget _indicatorBuilder(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      width: isActive ? 30 : 28,
      height: 4.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isActive ? AppTheme.onBackground : AppTheme.dividerColor,
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({
    Key? key,
    this.canBack = false,
    this.isLast = false,
    this.onBack,
    this.onNext,
  }) : super(key: key);
  final bool canBack, isLast;
  final VoidCallback? onBack, onNext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: context.mediaQueryViewPadding.bottom,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: canBack ? onBack : null,
            child: Text(
              'BACK',
              style: context.subtitle1.copyWith(
                color: canBack ? AppTheme.onBackground : AppTheme.subtitleColor,
              ),
            ),
          ),
          isLast
              ? AppButton(
                  'Get Started',
                  onPressed: onNext,
                  borderRadius: 4,
                  fontSize: 16.sp,
                  color: context.primary,
                  textColor: context.onBackground,
                )
              : AppButton(
                  'NEXT',
                  onPressed: onNext,
                  borderRadius: 4,
                  fontSize: 16.sp,
                  color: context.primary,
                  textColor: context.onBackground,
                )
        ],
      ),
    );
  }
}
