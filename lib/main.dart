import 'package:animoo/core/di/injectable.dart';
import 'package:animoo/core/routing/router_configuration.dart';
import 'package:animoo/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => ToastificationWrapper(
        child: MaterialApp.router(
          title: 'Animoo',
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: RouterConfiguration.router,
        ),
      ),
    );
  }
}
