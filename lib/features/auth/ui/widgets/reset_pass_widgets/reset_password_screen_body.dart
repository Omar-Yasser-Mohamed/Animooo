import 'package:animoo/core/extentions/context_extentions.dart';
import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:animoo/features/auth/ui/widgets/reset_pass_widgets/reset_pass_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreenBody extends StatelessWidget {
  const ResetPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 18.w,
        right: 18.w,
        top: 8,
        bottom: context.bottomPadding + 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Create New Password",
            style: AppTextStyles.oR20.copyWith(
              color: AppColors.primary,
            ),
          ),

          12.verticalSizedBox,

          const ResetPassForm(),
          
        ],
      ),
    );
  }
}
