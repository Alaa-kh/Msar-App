import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';

class LoginNoAccountWidget extends StatelessWidget {
  const LoginNoAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/register'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Center(
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'ليس لديك حساب؟ ',
                  style: TextStyle(color: AppColors.dark),
                ),
                TextSpan(
                  text: 'إنشاء حساب',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.go('/register'),
                ),
              ],
            ),
          ).fadeUp(),
        ),
      ),
    );
  }
}
