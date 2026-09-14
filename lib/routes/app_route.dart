import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_access_token_app/modules/admin/dashboard/dashboard_binding.dart';
import 'package:getx_access_token_app/modules/admin/dashboard/dashboard_view.dart';
import 'package:getx_access_token_app/modules/admin/post/post_binding.dart';
import 'package:getx_access_token_app/modules/admin/post/post_view.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import 'route_name.dart';

class AppRoute {
  AppRoute._();

  static List<GetPage> getAllRoutes() {
    return [
      GetPage(
        name: RouteName.splash,
        page: () => SplashView(),
        binding: SplashBinding(),
      ),
      GetPage(
        name: RouteName.home,
        page: () => HomeView(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: RouteName.login,
        page: () => LoginView(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: RouteName.adminDashboard,
        page: () => DashboardView(),
        binding: DashboardBinding(),
      ),
      GetPage(
        name: RouteName.adminPosts,
        page: () => PostView(),
        binding: PostBinding(),
      ),
    ];
  }
}
