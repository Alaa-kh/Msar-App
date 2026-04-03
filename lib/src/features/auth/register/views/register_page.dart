import 'package:flutter/material.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/features/auth/register/views/widgets/register_form_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: RegisterFormWidget(),
      ),
    );
  }
}
