import 'package:animoo/core/extentions/context_extentions.dart';
import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/features/auth/ui/widgets/forget_pass_widgets.dart/forget_pass_form.dart';
import 'package:animoo/features/auth/ui/widgets/forget_pass_widgets.dart/forget_pass_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassScreenBody extends StatelessWidget {
  const ForgetPassScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
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
          const ForgetPassHeader(),

          38.verticalSizedBox,

          const ForgetPassForm(),
        ],
      ),
    );
  }
}
