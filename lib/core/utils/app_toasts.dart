import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class AppToasts {
  AppToasts._();

  static void showSuccess(
    BuildContext context, {
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 3),
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: Text(
        title ?? 'Success',
        style: AppTextStyles.pSB14.copyWith(color: AppColors.success),
      ),
      description: Text(
        message,
        style: AppTextStyles.pR13.copyWith(color: AppColors.success),
      ),
      alignment: Alignment.topCenter,
      autoCloseDuration: duration,
      primaryColor: AppColors.success,
      backgroundColor: AppColors.success.withValues(alpha: .1),
      borderSide: BorderSide(
        color: AppColors.success.withValues(alpha: .3),
      ),
      borderRadius: BorderRadius.circular(12),
      showProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
    );
  }

  static void showError(
    BuildContext context, {
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 4),
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text(
        title ?? 'Error',
        style: AppTextStyles.pSB14.copyWith(color: AppColors.error),
      ),
      description: Text(
        message,
        style: AppTextStyles.pR13.copyWith(color: AppColors.error),
      ),
      alignment: Alignment.topCenter,
      autoCloseDuration: duration,
      primaryColor: AppColors.error,
      backgroundColor: AppColors.error.withValues(alpha: .1),
      borderSide: BorderSide(
        color: AppColors.error.withValues(alpha: .3),
      ),
      borderRadius: BorderRadius.circular(12),
      showProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
    );
  }
}
