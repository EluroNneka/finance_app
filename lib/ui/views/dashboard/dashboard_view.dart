import 'package:finance_app/style/colors.dart';
import 'package:finance_app/ui/views/dashboard/dashboard_controller.dart';
import 'package:finance_app/ui/views/login/login_controller.dart';
import 'package:finance_app/ui/widgets/newscard_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: 1458.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff05021B), Colors.black],
                  begin: Alignment.topRight,
                  stops: [0.3, 1]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: controller.getUserData(),
                  builder: (c, s) =>
                  Container(
                    height: 161.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 68.h),
                    child: Text(
                      'Hey ${s.data.toString()}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Raleway",
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                if (controller.news.isEmpty && controller.loading == false)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    color: Colors.black,
                    child: const Text(
                      'Something went wrong. Please try again later.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Rubik",
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  )
                else if (controller.news.isEmpty && controller.loading == true)
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 40.h,
                      width: 40.w,
                      child: const CircularProgressIndicator(
                        backgroundColor: AppColors.primary,
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: NewsCardList(data: controller.news),
                  ),
              ],
            ),
          ));
    });
  }
}
