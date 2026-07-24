import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class OtpHeader extends StatelessWidget {
  const OtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "OTP Verfication",
          style: AppTextStyles.oR20.copyWith(
            color: AppColors.primary,
          ),
        ),

        6.verticalSizedBox,

        Padding(
          padding: const EdgeInsetsDirectional.only(start: 4, end: 6),
          child: Text(
            "Please enter the 5 digit code sent your email address.",
            style: AppTextStyles.pR14.copyWith(
              color: const Color(0xff212529).withValues(alpha: .6),
            ),
          ),
        ),
      ],
    );
  }
}
