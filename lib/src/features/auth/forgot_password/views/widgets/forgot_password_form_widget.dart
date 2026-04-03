import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/constants/app_icons.dart';
import 'package:msar/src/core/constants/app_images.dart';
import 'package:msar/src/core/widgets/app_button.dart';
import 'package:msar/src/core/widgets/app_text_field.dart';
import 'package:svg_flutter/svg.dart';

class ForgotPasswordFormWidget extends StatelessWidget {
  const ForgotPasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Image.asset(AppImages.logoColors).scaleIn(),
        const SizedBox(height: 12),
        Text(
          'أدخل بريدك الالكتروني لإعادة تعيين كلمة المرور الخاصة بك.',
          style: const TextStyle(fontSize: 16, color: AppColors.dark),
        ).fadeUp(),
        const SizedBox(height: 24),
        AppTextField(
          hintTextDirection: TextDirection.rtl,
          label: 'البريد الإلكتروني',
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: SvgPicture.asset(AppIcons.email, width: 1, height: 1),
          ),
        ).fadeUp(),
        SizedBox(height: screenHeight * 0.2),
        AppButton(
          title: 'التالي',
          onPressed: () {
            context.go('/home');
          },
        ).scaleIn(),
        const SizedBox(height: 13),
      ],
    );
  }
}
