import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/routing/app_routes.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:animoo/core/utils/app_validators.dart';
import 'package:animoo/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpVerifyForm extends StatefulWidget {
  const OtpVerifyForm({super.key});

  @override
  State<OtpVerifyForm> createState() => _OtpVerifyFormState();
}

class _OtpVerifyFormState extends State<OtpVerifyForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 54.w,
      height: 54.h,
      textStyle: AppTextStyles.pSB20.copyWith(
        color: AppColors.primary,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.borderOtpField,
          width: 1,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(
          color: AppColors.primary,
          width: 1.5,
        ),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(
          color: AppColors.success,
          width: 1,
        ),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(
          color: AppColors.error,
          width: 1,
        ),
      ),
    );

    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          Pinput(
            controller: _otpController,
            length: 5,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            separatorBuilder: (_) => 16.horizontalSizedBox,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            validator: AppValidators.required,
          ),
      
          40.verticalSizedBox,
      
          AppButton(
            text: "Confirm",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.push(AppRoutes.resetPassword);
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
