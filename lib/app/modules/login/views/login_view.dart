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
                  'Login',
                  style: TextStyle(fontSize: 32.sp),
                ),
                SizedBox(height: 53.h),
                InputCustom(
                  titleInput: 'Username',
                  controller: controller.userNameCtr,
                  hintText: "Type in your name",
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
                  titleInput: 'Password',
                  controller: controller.passwordCtr,
                  hintText: "Type in your password",
                  validator: Validator.validateAll(
                    [
                      IdValidator(
                        StringUtils.emptyPassword,
                        onError: controller.validatePassword,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.h),
                BottomButtonAuthen(
                  titleForm: 'Login',
                  onPressed: controller.submitForm,
                  onPressedWithGoogle: () =>
                      Get.offAndToNamed(Routes.dashboard),
                  onPressedWithApple: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigatorForm(
        content: "Don’t have an account? ",
        textButton: 'Register',
        onTap: () => Get.toNamed(Routes.register),
      ),
    );
  }
}
