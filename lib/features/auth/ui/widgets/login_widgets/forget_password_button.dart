import 'package:animoo/core/routing/app_routes.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
        child: GestureDetector(
          onTap: () {
            context.push(AppRoutes.forgetPass);
          },
          child: Text(
            "Forget Password...?",
            style: AppTextStyles.pM10.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
