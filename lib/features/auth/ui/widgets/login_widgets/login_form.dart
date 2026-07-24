import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_field.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:animoo/core/widgets/app_button.dart';
import 'package:animoo/features/auth/ui/widgets/login_widgets/forget_password_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isVisable = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextLabel(label: 'Email'),

          6.verticalSizedBox,

          const AppTextField(
            hintText: "Enter your email address",
          ),

          16.verticalSizedBox,

          _buildTextLabel(label: 'Password'),

          6.verticalSizedBox,

          AppTextField(
            hintText: "********",
            obscureText: !_isVisable,
            suffixIcon: _buildVisibilityIcon(),
          ),

          const ForgetPasswordButton(),

          30.verticalSizedBox,

          AppButton(
            text: "Log In",
            onPressed: () {},
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

  Widget _buildVisibilityIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isVisable = !_isVisable;
        });
      },
      icon: Icon(
        _isVisable ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: AppColors.iconField,
      ),
    );
  }
}
