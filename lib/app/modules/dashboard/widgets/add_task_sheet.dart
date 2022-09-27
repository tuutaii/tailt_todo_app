import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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
            'Add Task',
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
              hintText: 'Title',
              hintStyle: TextStyle(color: Colors.grey[800]),
              fillColor: AppTheme.filled,
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
              hintText: 'Decription',
              hintStyle: TextStyle(color: Colors.grey[800]),
              fillColor: AppTheme.filled,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                splashRadius: 20,
                onPressed: controller.openPickTime,
                icon: SvgPicture.asset(AppImage.timer),
              ),
              SizedBox(width: 20.w),
              IconButton(
                splashRadius: 20,
                onPressed: () {},
                icon: SvgPicture.asset(AppImage.tag),
              ),
              SizedBox(width: 20.w),
              IconButton(
                splashRadius: 20,
                onPressed: () {},
                icon: SvgPicture.asset(AppImage.flag),
              ),
              const Spacer(),
              IconButton(
                splashRadius: 20,
                onPressed: () {},
                icon: SvgPicture.asset(AppImage.send),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
