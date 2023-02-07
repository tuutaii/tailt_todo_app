import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/core/styles/style.dart';
import 'package:todo_app/app/core/utilities/image.dart';
import 'package:todo_app/app/modules/dashboard/controllers/dashboard_controller.dart';

class AddTaskSheet extends GetView<DashboardController> {
  const AddTaskSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.addTask.tr,
            style: context.headline6.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14.h),
          TextFormField(
            controller: controller.taskTitleCtr,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              filled: true,
              hintText: LocaleKeys.taskTitle.tr,
              hintStyle: TextStyle(color: Colors.grey[800]),
              fillColor: context.secondary.withOpacity(.5),
            ),
          ),
          SizedBox(height: 14.h),
          TextFormField(
            controller: controller.taskDecriptionCtr,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              filled: true,
              hintText: LocaleKeys.taskDecrip.tr,
              hintStyle: TextStyle(color: Colors.grey[800]),
              fillColor: context.secondary.withOpacity(.5),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                splashRadius: 20,
                onPressed: controller.openPickTime,
                icon: SvgPicture.asset(
                  AppImage.timer,
                  color: context.surface,
                ),
              ),
              SizedBox(width: 20.w),
              IconButton(
                splashRadius: 20,
                onPressed: controller.openPickTag,
                icon: SvgPicture.asset(
                  AppImage.tag,
                  color: context.surface,
                ),
              ),
              SizedBox(width: 20.w),
              IconButton(
                splashRadius: 20,
                onPressed: controller.openPickCategory,
                icon: SvgPicture.asset(
                  AppImage.flag,
                  color: context.surface,
                ),
              ),
              const Spacer(),
              IconButton(
                splashRadius: 20,
                onPressed: controller.onSave,
                icon: SvgPicture.asset(AppImage.send),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
