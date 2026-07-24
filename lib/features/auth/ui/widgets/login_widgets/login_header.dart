import 'package:animoo/core/constants/app_images.dart';
import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.logo,
          width: 72.w,
          height: 92.h,
        ),

        10.verticalSizedBox,

        Text(
          "Log In",
          style: AppTextStyles.oR32.copyWith(
            fontSize: 38.sp,
          ),
        ),
      ],
    );
  }
}
