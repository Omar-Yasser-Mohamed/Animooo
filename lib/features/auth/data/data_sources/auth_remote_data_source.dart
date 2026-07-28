import 'package:animoo/core/shared/models/user_model.dart';
import 'package:animoo/features/auth/data/models/login_request.dart';
import 'package:animoo/features/auth/data/models/signup_request.dart';
import 'package:animoo/features/auth/data/models/auth_response.dart';
import 'package:animoo/features/auth/data/models/verification_code_request.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login(LoginRequest request);
  Future<UserModel> signup(SignupRequest request);
  Future<void> forgetPassword(String email);
  Future<AuthResponse> verifyCode(VerificationCodeRequest request);

}