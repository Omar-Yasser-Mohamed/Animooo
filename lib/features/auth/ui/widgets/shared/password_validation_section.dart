import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:animoo/core/utils/password_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidationSection extends StatelessWidget {
  const PasswordValidationSection({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (_, value, _) {
        final validation = PasswordValidator.validate(value.text);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            4.verticalSizedBox,

            Text(
              "Please add all necessary characters to create safe password.",
              style: AppTextStyles.pSB10.copyWith(
                color: validation.isValid ? AppColors.success : AppColors.error,
              ),
            ),

            6.verticalSizedBox,

            _PasswordRequirementItem(
              text: "Minimum characters 12.",
              isValid: validation.hasMinLength,
            ),

            2.verticalSizedBox,

            _PasswordRequirementItem(
              text: "One uppercase character.",
              isValid: validation.hasUppercase,
            ),

            2.verticalSizedBox,

            _PasswordRequirementItem(
              text: "One lowercase character.",
              isValid: validation.hasLowercase,
            ),

            2.verticalSizedBox,

            _PasswordRequirementItem(
              text: "One special character.",
              isValid: validation.hasSpecialCharacter,
            ),

            2.verticalSizedBox,

            _PasswordRequirementItem(
              text: "One number.",
              isValid: validation.hasNumber,
            ),
          ],
        );
      },
    );
  }
}

class _PasswordRequirementItem extends StatelessWidget {
  const _PasswordRequirementItem({required this.text, required this.isValid});

  final String text;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    final color = isValid ? AppColors.success : AppColors.error;

    return Row(
      children: [
        Container(
          height: 5.h,
          width: 5.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),

        4.horizontalSizedBox,

        Text(
          text,
          style: AppTextStyles.pSB10.copyWith(
            color: color,
            decoration: isValid ? TextDecoration.lineThrough : null,
          ),
        ),
      ],
    );
  }
}
