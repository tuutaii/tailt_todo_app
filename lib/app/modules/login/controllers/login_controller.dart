import 'package:get/get.dart';
import 'package:todo_app/app/core/mixin/form_mixin.dart';
import 'package:todo_app/app/core/styles/style.dart';

import '../../../data/services/firebase_authen/authController.dart';

class LoginController extends GetxController with FormMixin {
  AuthService get _auth => Get.find();
  final isLoading = false.obs;

  final userNameCtr = TextEditingController();
  final passwordCtr = TextEditingController();

  final _errorId = Rxn<String>();
  String get errorId => _errorId.value ?? '';

  final _errorPassword = Rxn<String>();
  String get errorPassword => _errorPassword.value ?? '';

  @override
  void onInit() {
    super.onInit();
    userNameCtr.text = 'tai@gmail.com';
    passwordCtr.text = '123456';
    Get.put(AuthService());
  }

  @override
  void onClose() {
    super.onClose();
    userNameCtr.dispose();
    passwordCtr.dispose();
  }

  @override
  Future<void> submitForm() async {
    isLoading(true);
    super.submitForm();
    _auth.login(userNameCtr.text.trim(), passwordCtr.text.trim());
    isLoading(false);
  }

  void validateId(String errorText) {
    _errorId(errorText);
  }

  void validatePassword(String errorText) {
    _errorPassword(errorText);
  }
}
