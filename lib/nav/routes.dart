import 'package:finance_app/ui/views/dashboard/dashboard_view.dart';
import 'package:finance_app/ui/views/login/login_view.dart';
import 'package:finance_app/ui/views/news_binding.dart';
import 'package:finance_app/ui/views/notification/notification_view.dart';
import 'package:finance_app/ui/views/splash_view.dart';
import 'package:get/get.dart';

class Routes {
  static const String splash = '/splash';
  static const String notification = '/notification';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
}

///This class handles navigation in the app
class Routers {
  final List<GetPage> views = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: Routes.notification,
      page: () => const NotificationView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardView(),
      binding: NewsBinding(),
    ),
  ];
}
