import 'package:animoo/core/extentions/context_extentions.dart';
import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/features/auth/ui/args/otp_args.dart';
import 'package:animoo/features/auth/ui/widgets/otp_widgets/otp_header.dart';
import 'package:animoo/features/auth/ui/widgets/otp_widgets/otp_resend_code.dart';
import 'package:animoo/features/auth/ui/widgets/otp_widgets/otp_verify_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OtpVerificationScreenBody extends StatelessWidget {
  const OtpVerificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final args = GoRouterState.of(context).extra as OtpArgs;
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 18.w,
        right: 18.w,
        top: 8,
        bottom: context.bottomPadding + 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OtpHeader(),

          54.verticalSizedBox,

          OtpVerifyForm(email: args.email),

          16.verticalSizedBox,

          Center(child: OtpResendCode(email: args.email)),
        ],
      ),
    );
  }
}
