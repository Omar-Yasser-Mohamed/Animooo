import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:animoo/features/auth/ui/args/otp_args.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OtpHeader extends StatelessWidget {
  const OtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final args = GoRouterState.of(context).extra as OtpArgs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          args.purpose.title,
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
