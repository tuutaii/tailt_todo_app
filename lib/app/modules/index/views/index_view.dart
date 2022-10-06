import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/core/utilities/image.dart';
import 'package:todo_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import '../../../core/styles/style.dart';
import '../../../widget/common/app_bar_custom.dart';
import '../widgets/task_item.dart';

class IndexView extends GetView<DashboardController> {
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
            'https://s1.o7planning.com/en/12997/images/64425712.png',
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: GetBuilder<DashboardController>(
        init: DashboardController(),
        initState: (_) {},
        builder: (controller) {
          controller.getData();
          if (controller.taskList.isNotEmpty) {
            return Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: 'Search for your task...',
                      fillColor: AppTheme.filled,
                    ),
                    onChanged: (content) => controller.filterPlayer(content),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.listTaskSearch.value.length,
                      itemBuilder: (context, index) {
                        final post = controller.listTaskSearch.value[index];
                        return TaskItem(
                          taskItem: post,
                          onTap: () => {
                            controller.gotoDetail(index),
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return emptyItem(context);
          }
        },
      ),
    );
  }

  Widget emptyItem(BuildContext context) {
    return Center(
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
    );
  }
}
