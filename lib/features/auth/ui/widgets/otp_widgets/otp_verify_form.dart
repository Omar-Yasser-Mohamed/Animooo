import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/routing/app_routes.dart';
import 'package:animoo/core/shared/states/ui_state.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:animoo/core/utils/app_toasts.dart';
import 'package:animoo/core/utils/app_validators.dart';
import 'package:animoo/core/widgets/app_button.dart';
import 'package:animoo/features/auth/data/models/auth_response.dart';
import 'package:animoo/features/auth/data/models/verification_code_request.dart';
import 'package:animoo/features/auth/ui/args/otp_args.dart';
import 'package:animoo/features/auth/ui/view_models/verify_code_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpVerifyForm extends StatefulWidget {
  const OtpVerifyForm({super.key, required this.email});
  final String email;

  @override
  State<OtpVerifyForm> createState() => _OtpVerifyFormState();
}

class _OtpVerifyFormState extends State<OtpVerifyForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final _otpController = TextEditingController();

  late final VerifyCodeProvider _verifyCodeProvider;

  @override
  void initState() {
    super.initState();
    _verifyCodeProvider = context.read<VerifyCodeProvider>();
    _verifyCodeProvider.addListener(_listener);
  }

  void _listener() {
    final state = _verifyCodeProvider.uiState;
    if (state is Success<AuthResponse>) {
      AppToasts.showSuccess(context, message: "Code verified successfully");
      final otppurpose = (GoRouterState.of(context).extra as OtpArgs).purpose;
      if (otppurpose == OtpPurpose.forgetPassword) {
        context.push(AppRoutes.resetPassword, extra: widget.email);
      } else {
        // context.go(AppRoutes.home);
      }
    } else if (state is Error<AuthResponse>) {
      AppToasts.showError(context, message: state.failure.message);
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    _verifyCodeProvider.removeListener(_listener);
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

          Consumer<VerifyCodeProvider>(
            builder: (_, verifyCodeProvider, child) {
              final state = verifyCodeProvider.uiState;
              return AppButton(
                text: "Confirm",
                isLoading: state is Loading<AuthResponse>,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _verifyCodeProvider.verifyCode(
                      VerificationCodeRequest(
                        code: _otpController.text,
                        email: widget.email,
                      ),
                    );
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
