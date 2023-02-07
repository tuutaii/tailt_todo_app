import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/core/utilities/validator/validator.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/string.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/widget_authen/bottom_button_form.dart';
import '../../../widget/widget_authen/bottom_navigator_form.dart';
import '../../../widget/widget_authen/input_custom.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
                  LocaleKeys.loginTitle.tr,
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
                  titleInput: LocaleKeys.pass.tr,
                  controller: controller.passwordCtr,
                  hintText: LocaleKeys.typePass.tr,
                  validator: Validator.validateAll(
                    [
                      IdValidator(
                        StringUtils.emptyPassword.tr,
                        onError: controller.validatePassword,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.h),
                Obx(
                  () => BottomButtonAuthen(
                    titleForm: LocaleKeys.loginTitle.tr,
                    isLoading: controller.loading,
                    onPressed: controller.submitForm,
                    onPressedWithGoogle: () =>
                        Get.offAndToNamed(Routes.dashboard),
                    onPressedWithApple: () {
                      FirebaseFirestore.instance.collection('testing').add({
                        'timeStamp': Timestamp.fromDate(DateTime.now()),
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigatorForm(
        content: LocaleKeys.bottomLogin.tr,
        textButton: LocaleKeys.registerTitle.tr,
        onTap: () => Get.toNamed(Routes.register),
      ),
    );
  }
}
