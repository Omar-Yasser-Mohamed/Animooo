import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/routing/app_routes.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:animoo/core/utils/app_validators.dart';
import 'package:animoo/core/widgets/app_button.dart';
import 'package:animoo/core/widgets/app_text_field.dart';
import 'package:animoo/features/auth/ui/widgets/shared/password_validation_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPassForm extends StatefulWidget {
  const ResetPassForm({super.key});

  @override
  State<ResetPassForm> createState() => _ResetPassFormState();
}

class _ResetPassFormState extends State<ResetPassForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextLabel(label: "New Password"),

          6.verticalSizedBox,

          AppTextField(
            controller: _passwordController,
            hintText: "********",
            obscureText: !_isPasswordVisible,
            validator: (value) =>
                AppValidators.required(value, fieldName: "Password"),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.textlabel,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),

          8.verticalSizedBox,

          PasswordValidationSection(
            controller: _passwordController,
          ),

          16.verticalSizedBox,

          _buildTextLabel(label: "Confirm Password"),

          6.verticalSizedBox,

          AppTextField(
            controller: _confirmPasswordController,
            hintText: "********",
            obscureText: !_isConfirmPasswordVisible,
            validator: (value) =>
                AppValidators.confirmPassword(value, _passwordController.text),
            suffixIcon: IconButton(
              icon: Icon(
                _isConfirmPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.textlabel,
              ),
              onPressed: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
            ),
          ),

          64.verticalSizedBox,

          AppButton(
            text: "Submit",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.go(AppRoutes.login);
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

  Widget _buildTextLabel({required String label}) {
    return Text(
      label,
      style: AppTextStyles.pR16.copyWith(
        color: AppColors.textlabel,
      ),
    );
  }
}
