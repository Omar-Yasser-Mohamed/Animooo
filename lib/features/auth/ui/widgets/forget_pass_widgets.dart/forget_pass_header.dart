import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ForgetPassHeader extends StatelessWidget {
  const ForgetPassHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Forget Your Password ?",
          style: AppTextStyles.oR20.copyWith(
            color: AppColors.primary,
          ),
        ),

        6.verticalSizedBox,

        Padding(
          padding: const EdgeInsetsDirectional.only(start: 4, end: 6),
          child: Text(
            "Please enter the email address associated with your account, and we'll send you OTP to reset your password.",
            style: AppTextStyles.pR14.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
