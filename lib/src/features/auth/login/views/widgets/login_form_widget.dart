import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/constants/app_icons.dart';
import 'package:msar/src/core/constants/app_images.dart';
import 'package:msar/src/core/widgets/app_button.dart';
import 'package:msar/src/core/widgets/app_text_field.dart';
import 'package:msar/src/features/auth/login/views/widgets/login_no_account_widget.dart';
import 'package:msar/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:msar/src/features/auth/presentation/cubit/login_state.dart';
import 'package:svg_flutter/svg.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  Future<void> _login() async {
    await context.read<LoginCubit>().login(
          email: _emailController.text,
          password: _passwordController.text,
        );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.go('/home');
        }

        if (state is LoginFailure) {
          _showMessage(state.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Image.asset(AppImages.logoColors).scaleIn(),
            const SizedBox(height: 12),
            Text(
              'مرحباً بك في مسار',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.dark,
              ),
            ).fadeUp(),
            const SizedBox(height: 6),
            Text(
              'أدخل المعلومات لتسجيل الدخول',
              style: const TextStyle(fontSize: 16, color: AppColors.dark),
            ).fadeUp(),
            const SizedBox(height: 24),
            AppTextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintTextDirection: TextDirection.rtl,
              label: 'البريد الإلكتروني',
              prefix: Padding(
                padding: const EdgeInsets.only(right: 13, top: 15, bottom: 15),
                child: SvgPicture.asset(AppIcons.email, width: 1, height: 1),
              ),
            ).fadeUp(),
            AppTextField(
              controller: _passwordController,
              hintTextDirection: TextDirection.rtl,
              label: 'كلمة المرور',
              obscure: _obscurePassword,
              prefix: Padding(
                padding: const EdgeInsets.only(right: 12, top: 14, bottom: 14),
                child: SvgPicture.asset(AppIcons.password, width: 1, height: 1),
              ),
              suffix: IconButton(
                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                icon: SvgPicture.asset(AppIcons.eye),
              ),
            ).fadeUp(),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => context.push('/forgot_password'),
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ).fadeUp(),
              ),
            ),
            SizedBox(height: screenHeight * 0.2),
            AppButton(
              title: 'تسجيل الدخول',
              loading: isLoading,
              onPressed: isLoading ? null : _login,
            ).scaleIn(),
            const SizedBox(height: 13),
            const LoginNoAccountWidget(),
          ],
        );
      },
    );
  }
}