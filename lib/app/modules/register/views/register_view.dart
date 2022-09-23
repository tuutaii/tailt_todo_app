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
                  'Register',
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
                SizedBox(height: 25.h),
                InputCustom(
                  titleInput: 'Confirm Password',
                  controller: controller.passwordCtr,
                  hintText: "Type in your confirm password",
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
                  titleForm: 'Register',
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
        content: "Already have an account?",
        textButton: ' Login',
        onTap: () => Get.toNamed(Routes.login),
      ),
    );
  }
}
