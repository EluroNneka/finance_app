import 'package:finance_app/nav/routes.dart';
import 'package:finance_app/style/colors.dart';
import 'package:finance_app/ui/views/login/login_controller.dart';
import 'package:finance_app/ui/views/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (controller) {
      return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 34.h),
            color: const Color(0xffF9F9F9),
            child: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Icon-3.png',
                    width: 98.w,
                    height: 98.h,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const Text(
                    "Get the most out of Blott ✅",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto",
                      color: AppColors.textBColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Text(
                    "Allow notifications to stay in the loop with your payments, requests and groups.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                      color: AppColors.textGColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.dashboard);
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.h),
                    width: double.infinity,
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: AppColors.primary,
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                        color: AppColors.buttonTColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ])),
      );
    });
  }
}
