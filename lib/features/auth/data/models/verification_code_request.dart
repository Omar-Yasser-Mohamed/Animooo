class VerificationCodeRequest {
  final String email;
  final String code;

  VerificationCodeRequest({required this.email, required this.code});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'code': code,
    };
  }
}
