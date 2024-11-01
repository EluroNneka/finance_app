import 'package:finance_app/ui/views/news_controller.dart';
import 'package:finance_app/ui/widgets/newscard_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({
    super.key,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: 1458.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff05021B), Colors.black],
                  begin: Alignment.topRight,
                  stops: [0.5, 1]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 161.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 68.h),
                  child: Text(
                    'Hey ${controller.firstName}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Raleway",
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                if (controller.news.isEmpty)
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
