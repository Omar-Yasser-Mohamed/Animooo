import 'dart:async';

import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OtpResendCode extends StatefulWidget {
  const OtpResendCode({super.key});

  @override
  State<OtpResendCode> createState() => _OtpResendCodeState();
}

class _OtpResendCodeState extends State<OtpResendCode> {
  bool _resendIsActive = false;
  Timer? _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _resendIsActive = true;
          _timer?.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mins = _start ~/ 60;
    final secs = _start % 60;
    final formattedTime =
        "${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
    return Text.rich(
      TextSpan(
        text: "Resend Code ",
        style: AppTextStyles.pR12.copyWith(
          color: const Color(0xff180901).withValues(alpha: .9),
        ),
        children: [
          TextSpan(
            text: _resendIsActive ? "Resend Code" : "in $formattedTime",
            style: _resendIsActive
                ? AppTextStyles.pB12.copyWith(
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  )
                : AppTextStyles.pB12.copyWith(
                    color: const Color(0xff180901).withValues(alpha: .9),
                  ),
            recognizer: TapGestureRecognizer()
              ..onTap = _resendIsActive
                  ? () {
                      setState(() {
                        _start = 60;
                        _resendIsActive = false;
                      });
                      startTimer();
                    }
                  : null,
          ),
        ],
      ),
    );
  }
}
