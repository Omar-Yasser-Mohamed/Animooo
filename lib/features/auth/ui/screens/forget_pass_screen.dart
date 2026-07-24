import 'package:animoo/core/widgets/app_back_button.dart';
import 'package:animoo/features/auth/ui/widgets/forget_pass_widgets.dart/forget_pass_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: const AppBackButton(),
        ),
        leadingWidth: 150.w,
      ),
      body: const ForgetPassScreenBody(),
    );
  }
}
