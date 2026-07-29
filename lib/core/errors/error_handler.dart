import 'dart:io';
import 'package:animoo/core/constants/api_error_messages.dart';
import 'package:animoo/core/errors/exceptions.dart';
import 'package:animoo/core/errors/failure.dart';
import 'package:animoo/core/errors/failure_code.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      return _handleDio(error);
    } else if (error is NoInternetException) {
      return AppFailure(
        failureCode: FailureCode.network,
        message: FailureCode.network.message,
      );
    }

    return AppFailure(
      failureCode: FailureCode.unknown,
      message: FailureCode.unknown.message,
    );
  }

  static Failure _handleDio(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppFailure(
          failureCode: FailureCode.timeout,
          message: FailureCode.timeout.message,
        );

      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
        return AppFailure(
          failureCode: FailureCode.network,
          message: FailureCode.network.message,
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(
          error.response?.statusCode ?? 0,
          error.response?.data,
        );

      case DioExceptionType.cancel:
        return AppFailure(
          failureCode: FailureCode.cancelled,
          message: FailureCode.cancelled.message,
        );

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return AppFailure(
            failureCode: FailureCode.network,
            message: FailureCode.network.message,
          );
        }
        return AppFailure(
          failureCode: FailureCode.unknown,
          message: FailureCode.unknown.message,
        );
      case DioExceptionType.transformTimeout:
        return AppFailure(
          failureCode: FailureCode.timeout,
          message: FailureCode.timeout.message,
        );
    }
  }

  static Failure _handleBadResponse(
    int statusCode,
    dynamic data,
  ) {
    final String serverMessage = data is Map<String, dynamic>
        ? data['error'][0]?.toString() ?? "Unknown error occurred"
        : "Unknown error occurred";

    switch (statusCode) {
      case 400:
        return _handleServerMessage(
          serverMessage,
          AppFailure(
            failureCode: FailureCode.badRequest,
            message: serverMessage,
          ),
        );

      case 401:
        return _handleServerMessage(
          serverMessage,
          AppFailure(
            failureCode: FailureCode.unauthorized,
            message: serverMessage,
          ),
        );

      case 403:
        return _handleServerMessage(
          serverMessage,
          AppFailure(
            failureCode: FailureCode.forbidden,
            message: serverMessage,
          ),
        );

      case 404:
        return _handleServerMessage(
          serverMessage,
          AppFailure(
            failureCode: FailureCode.notFound,
            message: serverMessage,
          ),
        );

      case 409:
        return _handleServerMessage(
          serverMessage,
          AppFailure(
            failureCode: FailureCode.conflict,
            message: serverMessage,
          ),
        );

      case 422:
        return _handleServerMessage(
          serverMessage,
          AppFailure(
            failureCode: FailureCode.validation,
            message: serverMessage,
          ),
        );

      case 500:
      case 502:
      case 503:
        return _handleServerMessage(
          serverMessage,
          AppFailure(
            failureCode: FailureCode.server,
            message: serverMessage,
          ),
        );

      default:
        return _handleServerMessage(
          serverMessage,
          AppFailure(
            failureCode: FailureCode.unknown,
            message: serverMessage,
          ),
        );
    }
  }

  static Failure _handleServerMessage(
    String? message,
    Failure fallback,
  ) {
    if (message == null) return fallback;

    final messageLower = message.toLowerCase();

    if (messageLower.contains(ApiErrorMessages.emailAlreadyExists)) {
      return AppFailure(
        failureCode: FailureCode.emailAlreadyExists,
        message: FailureCode.emailAlreadyExists.message,
      );
    }
    if (messageLower.contains(ApiErrorMessages.accountNotVerified)) {
      return AppFailure(
        failureCode: FailureCode.accountNotVerified,
        message: FailureCode.accountNotVerified.message,
      );
    }
    if (messageLower.contains(ApiErrorMessages.passwordOrEmailNotTrue)) {
      return AppFailure(
        failureCode: FailureCode.accountNotExists,
        message: FailureCode.accountNotExists.message,
      );
    }
    if (messageLower.contains(ApiErrorMessages.invalidVerficationCode)) {
      return AppFailure(
        failureCode: FailureCode.invalidVerficationCode,
        message: FailureCode.invalidVerficationCode.message,
      );
    }
    return fallback;
  }
}
