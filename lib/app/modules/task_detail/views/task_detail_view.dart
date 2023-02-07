import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/core/styles/style.dart';
import 'package:todo_app/app/core/utilities/image.dart';
import 'package:todo_app/app/widget/common/app_bar_custom.dart';
import 'package:todo_app/app/widget/common/app_button.dart';

import '../../../data/models/tasks/task_model.dart';
import '../controllers/task_detail_controller.dart';

class TaskDetailView extends GetView<TaskDetailController> {
  const TaskDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitleCustom(
        leading: CloseButton(
          onPressed: Get.back,
          color: context.surface,
        ),
        title: '',
        action: IconButton(
          icon: Icon(
            Icons.refresh,
            color: context.surface,
          ),
          onPressed: () {},
          splashRadius: 20,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                dense: true,
                leading: const Icon(
                  Icons.circle_outlined,
                  size: 30,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    controller.taskModel.title,
                    style: context.headline6,
                  ),
                ),
                subtitle: Text(
                  controller.taskModel.decription,
                  style: context.subtitle1,
                ),
                trailing: InkWell(
                  child: SvgPicture.asset(
                    AppImage.edit,
                    height: 25.h,
                    color: context.surface,
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 40.h),
              TaskItemDetail(
                itemName: 'Task Time',
                itemIcon: Icons.timer_outlined,
                itemContent:
                    '${controller.taskModel.date} ${controller.taskModel.time}',
              ),
              TaskItemDetail(
                itemName: 'Task Category',
                itemIcon: CupertinoIcons.tags,
                isIcon: true,
                contentIcon: listCategory[controller.taskModel.category].icon,
                itemContent: listCategory[controller.taskModel.category].name,
              ),
              TaskItemDetail(
                itemName: 'Task Priority :',
                itemIcon: CupertinoIcons.flag,
                itemContent: controller.taskModel.tagNumber.toString(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            bottom: context.mediaQueryViewPadding.bottom,
            left: 20.w,
            right: 20.w),
        child: AppButton(
          'Delete Task',
          color: context.error,
          onPressed: controller.openDeleteTask,
        ),
      ),
    );
  }
}

class TaskItemDetail extends StatelessWidget {
  const TaskItemDetail({
    Key? key,
    required this.itemName,
    required this.itemIcon,
    required this.itemContent,
    this.isIcon = false,
    this.contentIcon,
  }) : super(key: key);
  final String itemName;
  final IconData itemIcon;
  final bool isIcon;
  final String itemContent;
  final IconData? contentIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Row(
        children: [
          Icon(itemIcon),
          SizedBox(width: 10.w),
          Text(itemName),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: context.dividerColor),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                isIcon
                    ? Icon(
                        contentIcon,
                        size: 14,
                      )
                    : const SizedBox(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(
                    itemContent,
                    style: context.caption.copyWith(
                      color: context.surface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
