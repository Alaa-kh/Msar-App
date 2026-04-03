import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/constants/app_icons.dart';
import 'package:msar/src/core/constants/app_images.dart';
import 'package:msar/src/core/widgets/app_button.dart';
import 'package:msar/src/core/widgets/app_text_field.dart';
import 'package:msar/src/features/auth/login/views/widgets/login_no_account_widget.dart';
import 'package:svg_flutter/svg.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

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
          hintTextDirection: TextDirection.rtl,
          label: 'البريد الإلكتروني',
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: SvgPicture.asset(AppIcons.email, width: 1, height: 1),
          ),
        ).fadeUp(),
        AppTextField(
          hintTextDirection: TextDirection.rtl,
          label: 'كلمة المرور',
          obscure: true,
          prefix: SvgPicture.asset(AppIcons.password, width: 1, height: 1),
          suffix: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.eye),
          ),
        ).fadeUp(),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: ()=> context.push('/forgot_password'),
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
        AppButton(title: 'تسجيل الدخول', onPressed: () {}).scaleIn(),
        const SizedBox(height: 13),
        LoginNoAccountWidget(),
      ],
    );
  }
}
