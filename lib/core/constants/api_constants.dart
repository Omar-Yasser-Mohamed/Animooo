import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConstants {
  static final String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static const String api = "/api";

  // auth
  static const String login = "$api/login";
  static const String signup = "$api/signup";
  static const String forgetPassword = "$api/forget_password";
  static const String verifyCode = "$api/verfication_code";
  static const String resetPassword = "$api/create_new_possword";
  static const String refreshToken = "$api/generateAccessToken";
}