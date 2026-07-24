import 'package:animoo/core/widgets/app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:animoo/features/auth/ui/widgets/otp_widgets/otp_verification_screen_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

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
      body: const OtpVerificationScreenBody(),
    );
  }
}
