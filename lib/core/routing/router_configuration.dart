import 'package:animoo/core/routing/app_routes.dart';
import 'package:animoo/features/auth/ui/screens/forget_pass_screen.dart';
import 'package:animoo/features/auth/ui/screens/login_screen.dart';
import 'package:animoo/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:animoo/features/auth/ui/screens/register_screen.dart';
import 'package:animoo/features/auth/ui/screens/reset_password_screen.dart';
import 'package:go_router/go_router.dart';

abstract class RouterConfiguration {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgetPass,
        builder: (context, state) => const ForgetPassScreen(),
      ),
      GoRoute(
        path: AppRoutes.otpVerification,
        builder: (context, state) => const OtpVerificationScreen(),
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
    ],
  );
}
