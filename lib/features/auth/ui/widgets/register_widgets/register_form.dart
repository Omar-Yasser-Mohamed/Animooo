import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/routing/app_routes.dart';
import 'package:animoo/core/shared/models/user_model.dart';
import 'package:animoo/core/shared/states/ui_state.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/utils/app_toasts.dart';
import 'package:animoo/core/utils/app_validators.dart';
import 'package:animoo/core/widgets/app_text_field.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:animoo/core/widgets/app_button.dart';
import 'package:animoo/features/auth/ui/args/otp_args.dart';
import 'package:animoo/features/auth/ui/view_models/signup_provider.dart';
import 'package:animoo/features/auth/ui/widgets/register_widgets/upload_profile_image_card.dart';
import 'package:animoo/features/auth/ui/widgets/shared/password_validation_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isVisable = false;
  bool _isConfirmVisable = false;

  late final SignupProvider _signupProvider;

  @override
  void initState() {
    super.initState();
    _signupProvider = context.read<SignupProvider>();
    _signupProvider.addListener(_listener);
  }

  void _listener() {
    final state = _signupProvider.signupState;
    if (state is Success<UserModel>) {
      AppToasts.showSuccess(
        context,
        message: 'A verification code has been sent to your email',
      );
      context.push(
        AppRoutes.otpVerification,
        extra: OtpArgs(
          purpose: OtpPurpose.emailVerification,
          email: state.data.email,
        ),
      );
    } else if (state is Error<UserModel>) {
      AppToasts.showError(context, message: state.failure.message);
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _signupProvider.removeListener(_listener);
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
          _buildTextLabel(label: 'First Name'),

          6.verticalSizedBox,

          AppTextField(
            controller: _firstNameController,
            hintText: "Enter your first name",
            validator: (value) {
              return AppValidators.required(value, fieldName: "First Name");
            },
          ),

          16.verticalSizedBox,

          _buildTextLabel(label: 'Last Name'),

          6.verticalSizedBox,

          AppTextField(
            controller: _lastNameController,
            hintText: "Enter your last name",
            validator: (value) {
              return AppValidators.required(value, fieldName: "Last Name");
            },
          ),

          16.verticalSizedBox,

          _buildTextLabel(label: 'Email'),

          6.verticalSizedBox,

          AppTextField(
            controller: _emailController,
            hintText: "Enter your email address",
            validator: (value) => AppValidators.email(value),
          ),

          16.verticalSizedBox,

          _buildTextLabel(label: 'Phone'),

          6.verticalSizedBox,

          AppTextField(
            controller: _phoneController,
            hintText: "Enter your phone number",
            validator: (value) => AppValidators.phone(value),
          ),

          16.verticalSizedBox,

          _buildTextLabel(label: 'Password'),

          6.verticalSizedBox,

          AppTextField(
            controller: _passwordController,
            hintText: "********",
            obscureText: !_isVisable,
            validator: (value) =>
                AppValidators.required(value, fieldName: "Password"),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isVisable = !_isVisable;
                });
              },
              icon: Icon(
                _isVisable
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.iconField,
              ),
            ),
          ),

          8.verticalSizedBox,

          // Password Validation
          PasswordValidationSection(controller: _passwordController),

          16.verticalSizedBox,

          _buildTextLabel(label: 'Confirm Password'),

          6.verticalSizedBox,

          AppTextField(
            controller: _confirmPasswordController,
            hintText: "********",
            obscureText: !_isConfirmVisable,
            validator: (value) =>
                AppValidators.confirmPassword(value, _passwordController.text),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isConfirmVisable = !_isConfirmVisable;
                });
              },
              icon: Icon(
                _isConfirmVisable
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.iconField,
              ),
            ),
          ),

          16.verticalSizedBox,

          _buildTextLabel(label: 'Upload Image For Your Profile'),

          8.verticalSizedBox,

          const UploadProfileImageCard(),

          28.verticalSizedBox,

          Consumer<SignupProvider>(
            builder: (context, provider, child) {
              return AppButton(
                isLoading: provider.signupState is Loading<UserModel>,
                text: "Sign Up",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (_signupProvider.validateImage()) {
                      await _register();
                    } else {
                      AppToasts.showError(
                        context,
                        message: "Please upload profile image",
                      );
                    }
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

  Future<void> _register() async {
    await _signupProvider.signup(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      password: _passwordController.text,
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
