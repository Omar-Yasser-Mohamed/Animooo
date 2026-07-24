import 'package:animoo/core/routing/app_routes.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppTextStyles.pM14.copyWith(color: AppColors.textGray),
        children: [
          const TextSpan(text: "Have an account already? "),
          TextSpan(
            text: "Log in",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.go(AppRoutes.login);
              },
            style: AppTextStyles.pSB14.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
