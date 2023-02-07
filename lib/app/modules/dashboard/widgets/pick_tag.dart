import 'package:get/get.dart';
import 'package:todo_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import '../../../core/styles/style.dart';
import '../../../widget/common/app_button.dart';

class PickTagDialog extends GetView<DashboardController> {
  const PickTagDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Text(
            LocaleKeys.editPriority.tr,
            style: context.subtitle1,
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 16,
              runSpacing: 16,
              children: controller.items
                  .map((i) => Obx(
                        () => TagItem(
                          index: i,
                          isSelected: controller.tagSelected == i,
                          onPressed: () => controller.onPickTag(i),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: AppButton(
                  LocaleKeys.cancel.tr,
                  onPressed: Get.back,
                  type: ButtonType.text,
                  axisSize: MainAxisSize.max,
                  textColor: context.primary,
                ),
              ),
              Expanded(
                child: AppButton(
                  LocaleKeys.save.tr,
                  axisSize: MainAxisSize.max,
                  onPressed: Get.back,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TagItem extends StatelessWidget {
  const TagItem({
    Key? key,
    required this.index,
    required this.isSelected,
    this.onPressed,
  }) : super(key: key);
  final int index;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 64,
      child: MaterialButton(
        color: isSelected ? context.primary : AppTheme.filled,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.flag),
            SizedBox(height: 10.h),
            Text(index.toString()),
          ],
        ),
      ),
    );
  }
}
