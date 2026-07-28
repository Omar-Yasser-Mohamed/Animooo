import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/routing/app_routes.dart';
import 'package:animoo/core/shared/states/ui_state.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:animoo/core/utils/app_toasts.dart';
import 'package:animoo/core/utils/app_validators.dart';
import 'package:animoo/core/widgets/app_button.dart';
import 'package:animoo/core/widgets/app_text_field.dart';
import 'package:animoo/features/auth/ui/args/otp_args.dart';
import 'package:animoo/features/auth/ui/view_models/forget_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ForgetPassForm extends StatefulWidget {
  const ForgetPassForm({super.key});

  @override
  State<ForgetPassForm> createState() => _ForgetPassFormState();
}

class _ForgetPassFormState extends State<ForgetPassForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late final ForgetPasswordProvider _forgetPasswordProvider;

  @override
  void initState() {
    super.initState();
    _forgetPasswordProvider = context.read<ForgetPasswordProvider>();
    _forgetPasswordProvider.addListener(_listener);
  }

  void _listener() {
    final state = _forgetPasswordProvider.forgetPasswordState;
    if (state is Success<void>) {
      AppToasts.showSuccess(
        context,
        message: 'A verification code has been sent to your email',
      );
      context.push(
        AppRoutes.otpVerification,
        extra: OtpArgs(
          purpose: OtpPurpose.forgetPassword,
          email: _emailController.text,
        ),
      );
    } else if (state is Error<void>) {
      AppToasts.showError(context, message: state.failure.message);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _forgetPasswordProvider.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextLabel(label: "Email"),

          6.verticalSizedBox,

          AppTextField(
            controller: _emailController,
            hintText: "Enter your email address",
            validator: AppValidators.email,
          ),

          90.verticalSizedBox,

          Consumer<ForgetPasswordProvider>(
            builder: (context, provider, child) {
              return AppButton(
                isLoading: provider.forgetPasswordState is Loading,
                text: "SendCode",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _forgetPasswordProvider.forgetPassword(
                      _emailController.text,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
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

  Widget _buildTextLabel({required String label}) {
    return Text(
      label,
      style: AppTextStyles.pR16.copyWith(
        color: AppColors.textlabel,
      ),
    );
  }
}
