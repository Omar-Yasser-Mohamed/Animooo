import 'package:animoo/features/auth/ui/widgets/register_widgets/register_screen_body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterScreenBody(),
    );
  }
}