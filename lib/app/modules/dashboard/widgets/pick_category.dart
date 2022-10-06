import 'package:get/get.dart';
import 'package:todo_app/app/data/models/tasks/task_model.dart';
import 'package:todo_app/app/modules/dashboard/controllers/dashboard_controller.dart';

import '../../../core/styles/style.dart';
import '../../../widget/common/app_button.dart';

class PickCaregoryDialog extends GetView<DashboardController> {
  const PickCaregoryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Text(
            'Choose Category',
            style: context.subtitle1,
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 50,
              runSpacing: 16,
              children: listCategory
                  .map(
                    (e) => Obx(
                      () => CategoryItem(
                        categoryModel: e,
                        isSelected: controller.categorySelected ==
                            listCategory.indexOf(e),
                        onPressed: () =>
                            controller.onPickCategory(listCategory.indexOf(e)),
                      ),
                    ),
                  )
                  .toList(),
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
                child: AppButton(
                  'Save',
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

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    this.onPressed,
    required this.categoryModel,
    required this.isSelected,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final bool isSelected;
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox.square(
          dimension: 64,
          child: Opacity(
            opacity: isSelected ? 1 : .5,
            child: MaterialButton(
              color: categoryModel.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              onPressed: onPressed,
              child: Icon(
                categoryModel.icon,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          categoryModel.name,
          style: context.overline,
        ),
      ],
    );
  }
}
