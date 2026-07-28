import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/core/shared/states/ui_state.dart';
import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/utils/app_toasts.dart';
import 'package:animoo/core/utils/app_validators.dart';
import 'package:animoo/core/widgets/app_text_field.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:animoo/core/widgets/app_button.dart';
import 'package:animoo/features/auth/data/models/auth_response.dart';
import 'package:animoo/features/auth/data/models/login_request.dart';
import 'package:animoo/features/auth/ui/view_models/login_provider.dart';
import 'package:animoo/features/auth/ui/widgets/login_widgets/forget_password_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final LoginProvider _loginProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loginProvider = context.read<LoginProvider>();
      _loginProvider.addListener(_listener);
    });
  }

  void _listener() {
    final loginState = _loginProvider.loginState;

    if (loginState is Success<AuthResponse>) {
      AppToasts.showSuccess(context, message: "Login Successful");
    } else if (loginState is Error<AuthResponse>) {
      AppToasts.showError(context, message: loginState.failure.message);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _loginProvider.removeListener(_listener);
    super.dispose();
  }

  bool _isVisable = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextLabel(label: 'Email'),

          6.verticalSizedBox,

          AppTextField(
            controller: _emailController,
            hintText: "Enter your email address",
            validator: (value) {
              return AppValidators.required(value, fieldName: "Email");
            },
          ),

          16.verticalSizedBox,

          _buildTextLabel(label: 'Password'),

          6.verticalSizedBox,

          AppTextField(
            controller: _passwordController,
            hintText: "********",
            obscureText: !_isVisable,
            suffixIcon: _buildVisibilityIcon(),
            validator: (value) {
              return AppValidators.required(value, fieldName: "Password");
            },
          ),

          const ForgetPasswordButton(),

          30.verticalSizedBox,

          Consumer<LoginProvider>(
            builder: (context, provider, child) {
              return AppButton(
                isLoading: provider.loginState is Loading<AuthResponse>,
                text: "Log In",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await _login();
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

  Future<void> _login() async {
    await _loginProvider.login(
      LoginRequest(
        email: _emailController.text,
        password: _passwordController.text,
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
