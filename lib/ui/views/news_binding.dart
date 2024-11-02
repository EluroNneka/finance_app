import 'package:finance_app/ui/views/dashboard/dashboard_controller.dart';
import 'package:finance_app/ui/views/login/login_controller.dart';
import 'package:finance_app/ui/views/notification/notification_controller.dart';
import 'package:get/get.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => NotificationController());
    Get.lazyPut(() => DashboardController());
  }
}
