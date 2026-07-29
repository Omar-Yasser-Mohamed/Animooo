import 'package:animoo/core/errors/failure.dart';
import 'package:animoo/core/shared/models/user_model.dart';
import 'package:animoo/core/utils/either.dart';
import 'package:animoo/features/auth/data/models/auth_response.dart';
import 'package:animoo/features/auth/data/models/login_request.dart';
import 'package:animoo/features/auth/data/models/reset_password_request.dart';
import 'package:animoo/features/auth/data/models/signup_request.dart';
import 'package:animoo/features/auth/data/models/verification_code_request.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> login(LoginRequest request);
  Future<Either<Failure, UserModel>> signup(SignupRequest request);
  Future<Either<Failure, void>> forgetPassword(String email);
  Future<Either<Failure, AuthResponse>> verifyCode(
      VerificationCodeRequest request);
  Future<Either<Failure, AuthResponse>> resetPassword(
      ResetPasswordRequest request);
      Future<Either<Failure, String>> refreshAccessToken();
}