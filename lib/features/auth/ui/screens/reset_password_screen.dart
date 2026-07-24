import 'package:animoo/core/widgets/app_back_button.dart';
import 'package:animoo/features/auth/ui/widgets/reset_pass_widgets/reset_password_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: const AppBackButton(title: "Cancel"),
        ),
        leadingWidth: 150.w,
      ),
      body: const ResetPasswordScreenBody(),
    );
  }
}
