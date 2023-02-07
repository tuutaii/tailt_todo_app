import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/modules/profile/controllers/profile_controller.dart';

import '../../../core/styles/style.dart';
import '../../../widget/common/app_button.dart';

class ChangeLanguage extends GetView<ProfileController> {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Text(
            LocaleKeys.changeLanguage.tr,
            style: context.subtitle1,
          ),
          SizedBox(height: 5.h),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
            child: Column(
              children: [
                ListTile(
                  leading: Flag.fromCode(
                    FlagsCode.US,
                    height: 30,
                    width: 30,
                  ),
                  title: Text(
                    'English',
                    style: context.bodyText1,
                  ),
                  trailing: Transform.scale(
                    scale: 1.2,
                    child: Obx(
                      () => Radio(
                        activeColor: context.primary,
                        value: 0,
                        groupValue: controller.selectedLangguage.value,
                        onChanged: (int? value) {
                          controller.onSelectedLanguage(value ?? 0);
                        },
                      ),
                    ),
                  ),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.zero,
                ),
                ListTile(
                  leading: Flag.fromCode(
                    FlagsCode.VN,
                    height: 30,
                    width: 30,
                  ),
                  title: Text(
                    'Việt Nam',
                    style: context.bodyText1,
                  ),
                  trailing: Transform.scale(
                    scale: 1.2,
                    child: Obx(
                      () => Radio(
                        activeColor: context.primary,
                        value: 1,
                        focusColor: Colors.black,
                        groupValue: controller.selectedLangguage.value,
                        onChanged: (int? value) {
                          controller.onSelectedLanguage(value);
                        },
                      ),
                    ),
                  ),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.zero,
                ),
              ],
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
                  'OK',
                  axisSize: MainAxisSize.max,
                  onPressed: controller.onConfirmChange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
