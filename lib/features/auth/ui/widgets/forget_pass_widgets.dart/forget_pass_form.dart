import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/routing/app_routes.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:animoo/core/utils/app_validators.dart';
import 'package:animoo/core/widgets/app_button.dart';
import 'package:animoo/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPassForm extends StatefulWidget {
  const ForgetPassForm({super.key});

  @override
  State<ForgetPassForm> createState() => _ForgetPassFormState();
}

class _ForgetPassFormState extends State<ForgetPassForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _emailController.dispose();
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

          AppButton(
            text: "SendCode",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.push(AppRoutes.otpVerification);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
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
