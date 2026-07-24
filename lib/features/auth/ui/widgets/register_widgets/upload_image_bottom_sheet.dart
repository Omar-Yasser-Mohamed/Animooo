import 'dart:ui';

import 'package:animoo/core/extentions/context_extentions.dart';
import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadImageBottomSheet extends StatelessWidget {
  const UploadImageBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const UploadImageBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // upload image options
          _buildItemButton(
            title: "Photo Gallery",
            onTap: () {},
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
          ),

          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.borderGray,
          ),

          _buildItemButton(
            title: "Camera",
            onTap: () {},
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
            ),
          ),

          10.verticalSizedBox,

          // Cancel button
          _buildItemButton(
            title: "Cancel",
            alpha: .9,
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(10.r),
          ),

          (context.bottomPadding + 8).verticalSizedBox,
        ],
      ),
    );
  }

  Widget _buildItemButton({
    required String title,
    required VoidCallback onTap,
    BorderRadiusGeometry? borderRadius,
    double alpha = .8,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: alpha),
              borderRadius: borderRadius ?? BorderRadius.zero,
            ),
            child: Text(
              title,
              style: AppTextStyles.oR18.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
