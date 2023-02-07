import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/string.dart';
import '../../../core/utilities/validator/validator.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/widget_authen/bottom_button_form.dart';
import '../../../widget/widget_authen/bottom_navigator_form.dart';
import '../../../widget/widget_authen/input_custom.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.registerTitle.tr,
                  style: TextStyle(fontSize: 32.sp),
                ),
                SizedBox(height: 53.h),
                InputCustom(
                  titleInput: LocaleKeys.userName.tr,
                  controller: controller.userNameCtr,
                  hintText: LocaleKeys.typeName.tr,
                  validator: Validator.validateAll(
                    [
                      IdValidator(
                        StringUtils.emptyId,
                        onError: controller.validateId,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.h),
                InputCustom(
                  titleInput: StringUtils.pass,
                  controller: controller.passwordCtr,
                  hintText: LocaleKeys.typePass.tr,
                  validator: Validator.validateAll(
                    [
                      IdValidator(
                        StringUtils.emptyPassword,
                        onError: controller.validatePassword,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.h),
                InputCustom(
                  titleInput: LocaleKeys.confirmPass.tr,
                  controller: controller.passwordCtr,
                  hintText: LocaleKeys.typeConfirmPass.tr,
                  validator: Validator.validateAll(
                    [
                      IdValidator(
                        StringUtils.emptyPassword,
                        onError: controller.validatePassword,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                BottomButtonAuthen(
                  titleForm: LocaleKeys.registerTitle.tr,
                  onPressed: controller.submitForm,
                  onPressedWithGoogle: () {},
                  onPressedWithApple: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigatorForm(
        content: LocaleKeys.bottomRegister.tr,
        textButton: LocaleKeys.loginTitle.tr,
        onTap: () => Get.toNamed(Routes.login),
      ),
    );
  }
}
