import 'package:finance_app/style/colors.dart';
import 'package:finance_app/ui/views/news_controller.dart';
import 'package:finance_app/ui/widgets/custom_textfield.dart';
import 'package:finance_app/ui/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.secondary,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 58.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your legal name',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                    color: AppColors.splashBg,
                  ),
                ),
                SizedBox(
                  height: 26.h,
                ),
                const Text(
                  'We need to know a bit about you so that we can create your account.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                    color: AppColors.textGColor,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextField(
                  hintText: 'First name',
                  onChanged: (v) {
                    controller.setFirstName(v);
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextField(
                  hintText: 'Last name',
                  onChanged: (v) {
                    controller.setLastName(v);
                  },
                ),
                SizedBox(
                  height: 137.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RoundButton(
                    disable: controller.firstName == null ||
                        controller.lastName == null,
                    onTapped: () async {
                      await controller.registerUser(context);
                    },
                  ),
                ),
                SizedBox(
                  height: 40.h,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
