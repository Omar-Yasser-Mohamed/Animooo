import 'package:animoo/core/constants/api_constants.dart';
import 'package:animoo/core/network/api_service.dart';
import 'package:animoo/core/shared/models/user_model.dart';
import 'package:animoo/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:animoo/features/auth/data/models/auth_response.dart';
import 'package:animoo/features/auth/data/models/login_request.dart';
import 'package:animoo/features/auth/data/models/signup_request.dart';
import 'package:animoo/features/auth/data/models/verification_code_request.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService _apiService;

  AuthRemoteDataSourceImpl(this._apiService);

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
}
