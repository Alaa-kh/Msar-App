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
import 'package:msar/src/features/auth/presentation/cubit/forgot_password_cubit.dart';
import 'package:msar/src/features/auth/presentation/cubit/forgot_password_state.dart';
import 'package:svg_flutter/svg.dart';

class ForgotPasswordFormWidget extends StatefulWidget {
  const ForgotPasswordFormWidget({super.key});

  @override
  State<ForgotPasswordFormWidget> createState() =>
      _ForgotPasswordFormWidgetState();
}

class _ForgotPasswordFormWidgetState extends State<ForgotPasswordFormWidget> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _sendResetEmail() async {
    await context.read<ForgotPasswordCubit>().sendResetEmail(
          _emailController.text,
        );
  }


  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
             AppSnackBar.success(context, state.message);

          Future.delayed(const Duration(milliseconds: 700), () {
            if (context.mounted) {
              context.go('/login');
            }
          });
        }

        if (state is ForgotPasswordFailure) {
             AppSnackBar.error(context, state.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is ForgotPasswordLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Image.asset(AppImages.logoColors).scaleIn(),
            const SizedBox(height: 12),
            Text(
              'أدخل بريدك الالكتروني لإعادة تعيين كلمة المرور الخاصة بك.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.dark,
              ),
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
            SizedBox(height: screenHeight * 0.2),
            AppButton(
              title: 'التالي',
              loading: isLoading,
              onPressed: isLoading ? null : _sendResetEmail,
            ).scaleIn(),
            const SizedBox(height: 13),
          ],
        );
      },
    );
  }
}