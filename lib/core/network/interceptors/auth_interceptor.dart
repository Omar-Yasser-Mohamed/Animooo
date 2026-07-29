import 'package:animoo/core/di/injectable.dart';
import 'package:animoo/core/network/dio_service.dart';
import 'package:animoo/core/shared/services/token/token_service.dart';
import 'package:animoo/features/auth/data/repos/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final TokenService _tokenService;

  AuthInterceptor(this._tokenService);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenService.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
      // لو الخطأ مش 401 أصلاً، سيبه يمشي عادي
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final refreshToken = await _tokenService.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      return handler.next(err);
    }

    final result = await getIt<AuthRepo>().refreshAccessToken();

    await result.fold(
      (failure) async {
        // الـ refresh فشل -> امسح التوكنز واعمل logout لو محتاج
        // await _tokenService.clearTokens();
        handler.next(err);
      },
      (newToken) async {
        try {
          final retryResponse = await _retryRequest(err.requestOptions, newToken);
          handler.resolve(retryResponse);
        } on DioException catch (retryError) {
          handler.next(retryError);
        }
      },
    );
  }

  Future<Response> _retryRequest(
    RequestOptions requestOptions,
    String newToken,
  ) async {
    requestOptions.headers['Authorization'] = 'Bearer $newToken';

    // بنجيب الـ Dio instance وقت التنفيذ (lazy) مش في الـ constructor
    // عشان نتجنب circular dependency مع DioService
    final dio = getIt<DioService>().dio;

    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
      contentType: requestOptions.contentType,
      responseType: requestOptions.responseType,
    );

    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
      cancelToken: requestOptions.cancelToken,
    );
  }

}
