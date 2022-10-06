import 'package:get/get.dart';

import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/focuse/bindings/focuse_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/index/bindings/index_binding.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/start_screen/bindings/start_screen_binding.dart';
import '../modules/start_screen/views/start_screen_view.dart';
import '../modules/task_detail/bindings/task_detail_binding.dart';
import '../modules/task_detail/views/task_detail_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.welcome,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.startScreen,
      page: () => const StartScreenView(),
      binding: StartScreenBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
        name: _Paths.dashboard,
        page: () => const DashboardView(),
        binding: DashboardBinding(),
        bindings: [
          IndexBinding(),
          CalendarBinding(),
          FocuseBinding(),
          ProfileBinding(),
        ]),
    GetPage(
      name: _Paths.taskDetail,
      page: () => const TaskDetailView(),
      binding: TaskDetailBinding(),
    ),
  ];
}
