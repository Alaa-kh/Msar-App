import 'package:flutter/material.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/constants/app_icons.dart';
import 'package:msar/src/core/constants/app_images.dart';
import 'package:msar/src/core/widgets/app_button.dart';
import 'package:msar/src/core/widgets/app_text_field.dart';
import 'package:msar/src/features/auth/register/views/widgets/register_have_account_widget.dart';
import 'package:svg_flutter/svg.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          hintTextDirection: TextDirection.rtl,
          label: 'الاسم الكامل',
          prefix: SvgPicture.asset(AppIcons.person, width: 1, height: 1),
        ).fadeUp(),

        AppTextField(
          hintTextDirection: TextDirection.rtl,
          label: 'رقم الهاتف',
          prefix: SvgPicture.asset(AppIcons.phone, width: 1, height: 1),
        ).fadeUp(),
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
        const SizedBox(height: 23),
        AppButton(title: 'إنشاء حساب', onPressed: () {}).scaleIn(),
        const SizedBox(height: 13),
        RegisterHaveAccountWidget(),
      ],
    );
  }
}
