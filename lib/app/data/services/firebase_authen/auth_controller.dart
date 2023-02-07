import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/utilities/app_utils.dart';
import '../../../routes/app_pages.dart';

class AuthService extends GetxService {
  final _isAuth = false.obs;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isAuth => _isAuth.value;
  User? user;
  final _currentUser = Rxn<User>();
  User? get currentUser => _currentUser.value;

  @override
  void onInit() {
    super.onInit();
    _firebaseAuth.authStateChanges().listen((event) {
      _isAuth(event != null);
      _currentUser(event);
    });
  }

  void login(String email, password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      AppUtils.toast("Login Success");
      user = _firebaseAuth.currentUser;
      Get.offAllNamed(Routes.dashboard);
    } catch (e) {
      AppUtils.toast("Fail to login");
    }
  }

  void singUp(String email, password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      AppUtils.toast("Fail to create account");
    }
  }

  void logOut() async {
    await _firebaseAuth.signOut();
    Get.offAllNamed(Routes.login);
  }
}
