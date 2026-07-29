import 'package:animoo/core/network/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioService {
  late final Dio dio;
  final AuthInterceptor _authInterceptor;

  DioService(this._authInterceptor) {
    dio = Dio(
      BaseOptions(
        // baseUrl: ApiConstants.baseUrl, /// for real device
        baseUrl: "http://10.0.2.2:8000",

        /// for android emulator
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dioInterceptor();
  }

  void _dioInterceptor() {
    dio.interceptors.addAll([
      _authInterceptor,
      LogInterceptor(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    ]);
  }
}
