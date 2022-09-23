import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/core/utilities/image.dart';

import '../../../core/styles/style.dart';
import '../../../widget/common/app_bar_custom.dart';
import '../controllers/index_controller.dart';

class IndexView extends GetView<IndexController> {
  const IndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitleCustom(
        title: 'Index',
        leading: SvgPicture.asset(
          AppImage.sort,
        ),
        action: const CircleAvatar(
          radius: 21.0,
          backgroundImage: NetworkImage(
              'https://s1.o7planning.com/en/12997/images/64425712.png'),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 75.h),
            Image.asset(
              AppImage.indexImage,
              height: 227.h,
            ),
            Text(
              'What do you want to do today?',
              style: context.headline6,
            ),
            Text(
              'Tap + to add your tasks',
              style: context.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
