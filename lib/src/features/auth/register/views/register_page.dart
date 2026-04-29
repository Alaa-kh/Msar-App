import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/di/service_locator.dart';
import 'package:msar/src/features/auth/presentation/cubit/register_cubit.dart';
import 'package:msar/src/features/auth/register/views/widgets/register_form_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<RegisterCubit>(),
      child: const Scaffold(
        backgroundColor: AppColors.primaryLight,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: RegisterFormWidget(),
        ),
      ),
    );
  }
}