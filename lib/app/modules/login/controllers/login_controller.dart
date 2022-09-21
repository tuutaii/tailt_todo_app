import 'package:get/get.dart';
import 'package:todo_app/app/core/mixin/form_mixin.dart';
import 'package:todo_app/app/core/styles/style.dart';

class LoginController extends GetxController with FormMixin {
  final userNameCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final _errorId = Rxn<String>();
  String get errorId => _errorId.value ?? '';

  final _errorPassword = Rxn<String>();
  String get errorPassword => _errorPassword.value ?? '';

  @override
  Future<void> submitForm() async {
    super.submitForm();
  }

  void validateId(String errorText) {
    _errorId(errorText);
  }

  void validatePassword(String errorText) {
    _errorPassword(errorText);
  }
}
