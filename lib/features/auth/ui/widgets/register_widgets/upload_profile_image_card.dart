import 'dart:io';

import 'package:animoo/core/constants/app_icons.dart';
import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:animoo/features/auth/ui/widgets/register_widgets/upload_image_bottom_sheet.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UploadProfileImageCard extends StatefulWidget {
  const UploadProfileImageCard({super.key});

  @override
  State<UploadProfileImageCard> createState() => _UploadProfileImageCardState();
}

class _UploadProfileImageCardState extends State<UploadProfileImageCard> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: const RoundedRectDottedBorderOptions(
        color: AppColors.primary,
        dashPattern: [5, 3],
        strokeWidth: 1,
        radius: Radius.circular(10),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          final pickedImage = await UploadImageBottomSheet.show(context);
          if (pickedImage != null) {
            setState(() {
              image = pickedImage;
            });
          }
        },
        child: SizedBox(
          height: 200.h,
          width: double.infinity,
          child: image != null
              ? Stack(
                  children: [
                    Positioned.fill(
                      child: Image.file(
                        File(image!.path),
                        fit: BoxFit.fitHeight,
                      ),
                    ),

                    PositionedDirectional(
                      top: 10,
                      end: 10,
                      child: _buildRemoveButton(),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.imageIcon,
                      height: 28.h,
                      width: 28.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),

                    18.verticalSizedBox,

                    Text(
                      "Select File",
                      style: AppTextStyles.pM16.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildRemoveButton() {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => setState(() => image = null),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: .1),
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.error.withValues(alpha: .5),
          ),
        ),
        child: const Icon(
          Icons.close,
          size: 24,
          color: AppColors.error,
        ),
      ),
    );
  }
}
