import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../data/services/setting_service.dart';
import '../styles/style.dart';
import '../utilities/app_utils.dart';

mixin FormMixin on GetxController {
  final List<StreamSubscription> _subscription = [];
  SettingService get setting => Get.find();

  final _errorMessage = Rxn<String>();

  final _isSubmit = true.obs;
  final _loading = false.obs;

  bool isForm = true;
  bool isConnect = false;
  bool validate = false;

  CancelToken? cancelToken;

  final formKey = GlobalKey<FormState>();

  set loading(bool val) => _loading(val);
  set isSubmit(bool val) => _isSubmit(val);
  set errorMessage(String? val) => _errorMessage.value = val;

  String? get errorMessage => _errorMessage.value;
  bool get loading => _loading.value;
  bool get isSubmit => _isSubmit.value;
  bool get isValidate => formKey.currentState?.validate() ?? false;
  @protected
  @mustCallSuper
  @override
  void onInit() async {
    isConnect = setting.isConnect;
    afterCheckConnect(isConnect);
    final connectStream = setting.connectStream.listen((val) {
      isConnect = val;
      if (val) {
        connect();
      } else {
        disconnect();
      }
    });
    _subscription.add(connectStream);

    super.onInit();
  }

  @mustCallSuper
  void submitForm() async {
    cancelToken = CancelToken();
    Get.focusScope?.unfocus();
    errorMessage = null;

    if (isForm) {
      if (!isValidate) {
        validate = false;
        isSubmit = false;
        return;
      } else {
        isSubmit = true;
      }
    }
    if (!isConnect) {
      validate = false;
      return AppUtils.toast('StringUtils.pleaseCheckYourNetwor');
    }
    loading = true;
    validate = true;
  }

  @override
  void onClose() {
    for (var e in _subscription) {
      e.cancel();
    }
    cancelToken?.cancel();
    super.onClose();
  }

  @protected
  void connect() {}

  @mustCallSuper
  void disconnect() {
    if (loading) {
      loading = false;
      cancelToken?.cancel();
      AppUtils.toast('StringUtils.pleaseCheckYourNetwork');
    }
  }

  @protected
  void afterCheckConnect(bool connect) {}
}
