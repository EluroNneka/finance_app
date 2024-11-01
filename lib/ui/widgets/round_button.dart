import 'package:finance_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundButton extends StatelessWidget {
  final Function onTapped;
  final bool disable;
  final Color? color;

  const RoundButton({
    Key? key,
    required this.onTapped,
    this.color,
    this.disable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!disable) {
          HapticFeedback.heavyImpact();
          onTapped();
        }
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Opacity(
        opacity: 1,
        child: Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: disable == true
                ? AppColors.primary.withOpacity(0.4)
                : AppColors.primary,
          ),
          child: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
