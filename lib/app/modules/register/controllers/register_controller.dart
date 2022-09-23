import 'package:get/get.dart';
import 'package:todo_app/app/core/mixin/form_mixin.dart';

import '../../../core/styles/style.dart';
import '../../../data/services/firebase_authen/auth_controller.dart';

class RegisterController extends GetxController with FormMixin {
  AuthService get _auth => Get.find();

  final userNameCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final confirmPasswordCtr = TextEditingController();
  final _errorId = Rxn<String>();
  String get errorId => _errorId.value ?? '';

  final _errorPassword = Rxn<String>();
  String get errorPassword => _errorPassword.value ?? '';

  @override
  void onInit() {
    super.onInit();
    Get.put(AuthService());
  }

  @override
  void onClose() {
    userNameCtr.dispose();
    passwordCtr.dispose();
    confirmPasswordCtr.dispose();
    super.onClose();
  }

  @override
  Future<void> submitForm() async {
    super.submitForm();
    _auth.singUp(userNameCtr.text.trim(), passwordCtr.text.trim());
  }

  void validateId(String errorText) {
    _errorId(errorText);
  }

  void validatePassword(String errorText) {
    _errorPassword(errorText);
  }
}
