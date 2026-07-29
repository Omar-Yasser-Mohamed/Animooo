import 'package:animoo/core/constants/api_constants.dart';
import 'package:animoo/core/network/api_service.dart';
import 'package:animoo/core/shared/models/user_model.dart';
import 'package:animoo/core/shared/services/token/token_service.dart';
import 'package:animoo/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:animoo/features/auth/data/models/auth_response.dart';
import 'package:animoo/features/auth/data/models/login_request.dart';
import 'package:animoo/features/auth/data/models/reset_password_request.dart';
import 'package:animoo/features/auth/data/models/signup_request.dart';
import 'package:animoo/features/auth/data/models/verification_code_request.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService _apiService;
  final TokenService _tokenService;
  AuthRemoteDataSourceImpl(this._apiService, this._tokenService);

  @override
  Future<AuthResponse> login(LoginRequest request) async {
    final response = await _apiService.get(
      endpoint: "${ApiConstants.login}?${request.toQueryParams()}",
    );
    return AuthResponse.fromJson(response.data);
  }

  @override
  Future<UserModel> signup(SignupRequest request) async {
    final response = await _apiService.post(
      endpoint: ApiConstants.signup,
      data: await request.toFormData(),
    );
    return UserModel.fromJson(response.data["user"]);
  }

  @override
  Future<void> forgetPassword(String email) async {
    await _apiService.post(
      endpoint: ApiConstants.forgetPassword,
      data: {'email': email},
    );
  }

  @override
  Future<AuthResponse> verifyCode(VerificationCodeRequest request) async {
    final response = await _apiService.post(
      endpoint: ApiConstants.verifyCode,
      data: request.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  @override
  Future<AuthResponse> resetPassword(ResetPasswordRequest request) async {
    final response = await _apiService.post(
      endpoint: ApiConstants.resetPassword,
      data: request.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  @override
  Future<String> refreshAccessToken() async {
    final response = await _apiService.post(
      endpoint: ApiConstants.refreshToken,
      headers: {
        'refresh_token': await _tokenService.getRefreshToken(),
      },
    );
    return response.data['access_token'];
  }
}
