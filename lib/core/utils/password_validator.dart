import 'package:animoo/core/shared/models/password_validation.dart';

abstract final class PasswordValidator {
  static PasswordValidation validate(String password) {
    return PasswordValidation(
      hasMinLength: password.length >= 8,
      hasUppercase: RegExp(r'[A-Z]').hasMatch(password),
      hasLowercase: RegExp(r'[a-z]').hasMatch(password),
      hasNumber: RegExp(r'\d').hasMatch(password),
      hasSpecialCharacter: RegExp(
        r'[!@#\$%^&*(),.?":{}|<>_\-+=/\\[\]]',
      ).hasMatch(password),
    );
  }
}
