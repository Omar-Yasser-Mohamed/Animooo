import 'package:animoo/core/shared/models/user_model.dart';

class AuthResponse {
  final int statusCode;
  final String message;
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  AuthResponse({
    required this.statusCode,
    required this.message,
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    statusCode: (json['statusCode'] as num).toInt(),
    message: json['message'] as String,
    accessToken: json['access_token'] as String,
    refreshToken: json['refresh_token'] as String,
    user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  );
}