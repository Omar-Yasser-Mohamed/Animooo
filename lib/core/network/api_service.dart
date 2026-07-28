import 'package:animoo/core/errors/exceptions.dart';
import 'package:animoo/core/network/dio_service.dart';
import 'package:animoo/core/network/network_connectivity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  late final Dio _dio;
  final NetworkConnectivity networkConnectivity;

  ApiService(DioService dioService, this.networkConnectivity)
    : _dio = dioService.dio;

  Future<void> _checkInternet() async {
    final isConnected = await networkConnectivity.isConnected();
    if (!isConnected) {
      throw NoInternetException();
    }
  }

  Future<Response> get({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    await _checkInternet();
    final response = await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      data: data,
      options:
          options ??
          Options(
            headers: headers,
          ),
    );
    return response;
  }

  Future<Response> post({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    await _checkInternet();
    final response = await _dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options:
          options ??
          Options(
            headers: headers,
          ),
    );
    return response;
  }

  Future<Response> put({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    await _checkInternet();
    final response = await _dio.put(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options:
          options ??
          Options(
            headers: headers,
          ),
    );
    return response;
  }

  Future<Response> delete({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    await _checkInternet();
    final response = await _dio.delete(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options:
          options ??
          Options(
            headers: headers,
          ),
    );
    return response;
  }
}
