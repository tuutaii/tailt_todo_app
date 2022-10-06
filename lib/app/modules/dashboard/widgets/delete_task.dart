import 'package:get/get.dart';
import 'package:todo_app/app/modules/dashboard/controllers/dashboard_controller.dart';

import '../../../core/styles/style.dart';
import '../../../widget/common/app_button.dart';

class DeleteTask extends GetView<DashboardController> {
  const DeleteTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Text(
            'Edit Task Priority',
            style: context.subtitle1,
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(
              'Are You sure you want to delete this task?',
              style: context.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: AppButton(
                  'Cancel',
                  onPressed: Get.back,
                  type: ButtonType.text,
                  axisSize: MainAxisSize.max,
                  textColor: context.primary,
                ),
              ),
              Expanded(
                child: AppButton('OK',
                    axisSize: MainAxisSize.max,
                    onPressed: () => Get.back(result: true)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
