import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';

class RegisterHaveAccountWidget extends StatelessWidget {
  const RegisterHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/login'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Center(
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'لديك حساب؟ ',
                  style: TextStyle(color: AppColors.dark),
                ),
                TextSpan(
                  text: 'تسجيل الدخول',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.go('/login'),
                ),
              ],
            ),
          ).fadeUp(),
        ),
      ),
    );
  }
}
