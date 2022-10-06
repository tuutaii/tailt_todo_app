import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/core/styles/style.dart';
import 'package:todo_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:todo_app/app/modules/dashboard/widgets/day_builder.dart';
import 'package:todo_app/app/widget/common/app_button.dart';
import 'package:todo_app/app/widget/common/calendar_picker.dart';

class PickDateTime extends GetView<DashboardController> {
  const PickDateTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => controller.isChoseTime.value
                ? _choseTime(context)
                : _choseDate(context),
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
                child: Obx(
                  () => AppButton(
                    controller.isChoseTime.value ? 'Save' : 'Chose Time',
                    axisSize: MainAxisSize.max,
                    onPressed: controller.isChoseTime.value
                        ? () => Get.back()
                        : controller.onChoseTime,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _choseDate(BuildContext context) {
    return Column(
      children: [
        SizedBox.square(
          dimension: 300.h,
          child: CalenderPicker(
            firstDay: DateTime(2000, 1, 1),
            lastDay: DateTime(2030, 1, 1),
            focusedDay: controller.dateSelected,
            isActiveSelected: true,
            onDaySelected: controller.onDaySelected,
            toDateBuilder: (context, date, _) {
              return DayBuilder(date: date.day.toString());
            },
            selectedBuilder: (context, date, _) {
              return DayBuilder(
                date: date.day.toString(),
                selected: true,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _choseTime(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Text(
          'Chose Time',
          style: context.subtitle1,
        ),
        const Divider(),
        SizedBox(
          height: 100.h,
          width: 327.w,
          child: CupertinoTheme(
            data: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle: TextStyle(color: context.onBackground),
              ),
            ),
            child: CupertinoDatePicker(
              onDateTimeChanged: (newTime) {
                controller.onSelectedTime(
                    '${newTime.hour.toString()}:${newTime.minute.toString()}');
              },
              mode: CupertinoDatePickerMode.time,
              initialDateTime: DateTime.now(),
              minuteInterval: 1,
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
