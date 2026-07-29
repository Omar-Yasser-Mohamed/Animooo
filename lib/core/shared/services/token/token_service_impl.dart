import 'package:animoo/core/shared/services/token/token_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

class TokenKeys {
  static const accessToken = 'access_token';
  static const refreshToken = 'refresh_token';
}

@LazySingleton(as: TokenService)
class TokenServiceImpl implements TokenService {
  TokenServiceImpl(this._storage);
  final FlutterSecureStorage _storage;

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: TokenKeys.accessToken, value: accessToken),
      _storage.write(key: TokenKeys.refreshToken, value: refreshToken),
    ]);
  }

  @override
  Future<String?> getAccessToken() async {
    return await _storage.read(key: TokenKeys.accessToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: TokenKeys.refreshToken);
  }

  @override
  Future<void> deleteAllTokens() async {
    await _storage.deleteAll();
  }
}