import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.title = "Back"});
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.pop();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.translate(
            offset: Offset(0, -2.h),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primary,
              size: 20.sp,
            ),
          ),

          4.horizontalSizedBox,

          Text(
            title,
            style: AppTextStyles.oR20.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
