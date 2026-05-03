import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/constants/app_icons.dart';
import 'package:msar/src/core/constants/app_images.dart';
import 'package:msar/src/core/constants/app_snack_bar.dart';
import 'package:msar/src/core/widgets/app_button.dart';
import 'package:msar/src/core/widgets/app_text_field.dart';
import 'package:msar/src/features/auth/presentation/cubit/register_cubit.dart';
import 'package:msar/src/features/auth/presentation/cubit/register_state.dart';
import 'package:msar/src/features/auth/register/views/widgets/register_have_account_widget.dart';
import 'package:svg_flutter/svg.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  Future<void> _register() async {
    await context.read<RegisterCubit>().register(
      name: _nameController.text,
      phone: _phoneController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          context.go('/home');
        }

        if (state is RegisterFailure) {
          AppSnackBar.error(context, state.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is RegisterLoading;

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
              'أدخل المعلومات لإنشاء الحساب',
              style: const TextStyle(fontSize: 16, color: AppColors.dark),
            ).fadeUp(),
            const SizedBox(height: 24),
            AppTextField(
              controller: _nameController,
              hintTextDirection: TextDirection.rtl,
              label: 'الاسم الكامل',
              prefix: Padding(
                padding: const EdgeInsets.only(right: 12, top: 14, bottom: 14),
                child: SvgPicture.asset(AppIcons.person, width: 1, height: 1),
              ),
            ).fadeUp(),
            AppTextField(
              controller: _phoneController,
              hintTextDirection: TextDirection.rtl,
              keyboardType: TextInputType.phone,
              label: 'رقم الهاتف',
              prefix: Padding(
                padding: const EdgeInsets.only(right: 12, top: 14, bottom: 14),
                child: SvgPicture.asset(AppIcons.phone, width: 1, height: 1),
              ),
            ).fadeUp(),
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
                onPressed: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
                icon: SvgPicture.asset(AppIcons.eye),
              ),
            ).fadeUp(),
            const SizedBox(height: 23),
            AppButton(
              title: 'إنشاء حساب',
              loading: isLoading,
              onPressed: isLoading ? null : _register,
            ).scaleIn(),
            const SizedBox(height: 13),
            const RegisterHaveAccountWidget(),
          ],
        );
      },
    );
  }
}
