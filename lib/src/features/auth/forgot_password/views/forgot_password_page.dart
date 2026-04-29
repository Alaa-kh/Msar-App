import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/constants/app_icons.dart';
import 'package:msar/src/core/di/service_locator.dart';
import 'package:msar/src/core/widgets/app_bar.dart';
import 'package:msar/src/features/auth/forgot_password/views/widgets/forgot_password_form_widget.dart';
import 'package:msar/src/features/auth/presentation/cubit/forgot_password_cubit.dart';
import 'package:svg_flutter/svg.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ForgotPasswordCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          label: 'إعادة ضبط كلمة المرور',
          actions: SvgPicture.asset(AppIcons.arrow),
        ),
        backgroundColor: AppColors.primaryLight,
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: ForgotPasswordFormWidget(),
        ),
      ),
    );
  }
}