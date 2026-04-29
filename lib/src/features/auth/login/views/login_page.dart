import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/di/service_locator.dart';
import 'package:msar/src/features/auth/login/views/widgets/login_form_widget.dart';
import 'package:msar/src/features/auth/presentation/cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginCubit>(),
      child: const Scaffold(
        backgroundColor: AppColors.primaryLight,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: LoginFormWidget(),
        ),
      ),
    );
  }
}