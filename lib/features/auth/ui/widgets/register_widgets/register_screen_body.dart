import 'package:animoo/core/extentions/context_extentions.dart';
import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/features/auth/ui/widgets/register_widgets/register_footer.dart';
import 'package:animoo/features/auth/ui/widgets/register_widgets/register_form.dart';
import 'package:animoo/features/auth/ui/widgets/register_widgets/register_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: context.topPadding + 8,
        left: 18.w,
        right: 18.w,
        bottom: context.bottomPadding + 8,
      ),
      child: Column(
        children: [
          const RegisterHeader(),

          8.verticalSizedBox,

          const RegisterForm(),

          16.verticalSizedBox,

          const RegisterFooter(),
        ],
      ),
    );
  }
}
