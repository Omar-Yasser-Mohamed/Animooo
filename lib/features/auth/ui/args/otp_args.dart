enum OtpPurpose {
  emailVerification,
  forgetPassword;

  String get title => switch (this) {
    emailVerification => 'Email Verification',
    forgetPassword => 'OTP Verification',
  };
}

class OtpArgs {
  final OtpPurpose purpose;
  final String email;
  
  OtpArgs({
    required this.purpose,
    required this.email,
  });
}