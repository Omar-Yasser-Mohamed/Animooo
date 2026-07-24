import 'package:animoo/core/extentions/context_extentions.dart';
import 'package:animoo/core/extentions/sized_box_extentions.dart';
import 'package:animoo/features/auth/ui/widgets/login_widgets/login_footer.dart';
import 'package:animoo/features/auth/ui/widgets/login_widgets/login_form.dart';
import 'package:animoo/features/auth/ui/widgets/login_widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            top: context.topPadding + 8,
            left: 18.w,
            right: 18.w,
            bottom: context.bottomPadding + 8,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  constraints.maxHeight -
                  (context.bottomPadding + 8 + context.topPadding + 8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const LoginHeader(),

                    const LoginForm(),

                    16.verticalSizedBox,
                  ],
                ),

                const LoginFooter(),
              ],
            ),
          ),
        );
      },
    );
  }
}
