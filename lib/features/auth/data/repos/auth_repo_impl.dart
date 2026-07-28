import 'package:animoo/core/errors/error_handler.dart';
import 'package:animoo/core/errors/failure.dart';
import 'package:animoo/core/shared/models/user_model.dart';
import 'package:animoo/core/utils/either.dart';
import 'package:animoo/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:animoo/features/auth/data/models/auth_response.dart';
import 'package:animoo/features/auth/data/models/login_request.dart';
import 'package:animoo/features/auth/data/models/signup_request.dart';
import 'package:animoo/features/auth/data/models/verification_code_request.dart';
import 'package:animoo/features/auth/data/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, AuthResponse>> login(LoginRequest request) async {
    try {
      final response = await _remoteDataSource.login(request);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signup(SignupRequest request) async {
    try {
      final user = await _remoteDataSource.signup(request);
      return Right(user);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword(String email) async {
    try {
      await _remoteDataSource.forgetPassword(email);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> verifyCode(
    VerificationCodeRequest request,
  ) async {
    try {
      final response = await _remoteDataSource.verifyCode(request);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
