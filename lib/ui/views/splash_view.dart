import 'package:finance_app/core/services/database_service.dart';
import 'package:finance_app/nav/routes.dart';
import 'package:finance_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<StatefulWidget> createState() => _SplashView();
}

class _SplashView extends State<SplashView> {
  UserDatabaseManager user = UserDatabaseManager();

  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(seconds: 3),
        () =>
            //user.userTable. ?
            Get.toNamed(Routes.login)
        //:
        // Get.toNamed(Routes.dashboard)
        );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.splashBg,
      child: Center(
        child: SizedBox(
            height: 188.h,
            width: 188.w,
            child: Image.asset('assets/images/Logo.png')),
      ),
    );
  }
}
