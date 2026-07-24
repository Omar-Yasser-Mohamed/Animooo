import 'package:animoo/core/routing/app_routes.dart';
import 'package:animoo/features/auth/ui/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

abstract class RouterConfiguration {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      // GoRoute(
      //   path: AppRoutes.register,
      //   builder: (context, state) => const RegisterScreen(),
      // ),
    ],
  );
}
