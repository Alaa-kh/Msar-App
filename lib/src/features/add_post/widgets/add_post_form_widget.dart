import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/widgets/app_button.dart';
import 'package:msar/src/core/widgets/app_text_field.dart';

class AddPostFormWidget extends StatelessWidget {
  const AddPostFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Text(
            'عنوان المنشور (بالعربية)',
            style: TextStyle(color: AppColors.primary),
          ),
          AppTextField(hint: 'أدخل عنواناً جذاباً...'),
          const SizedBox(height: 15),
          Text(
            'وصف المنشور (بالعربية)',
            style: TextStyle(color: AppColors.primary),
          ),
          AppTextField(
            maxLines: 7,
            minLines: 1,
            hint: 'اكتب تفاصيل المنشور هنا...',
          ),
          const SizedBox(height: 15),
          Text('رقم الواتساب', style: TextStyle(color: AppColors.primary)),
          AppTextField(
            hint: 'أدخل رقم الواتساب هنا...',
            keyboardType: TextInputType.phone,
            formatter: [
              FilteringTextInputFormatter.allow(RegExp(r'^\+?[0-9]*$')),
            ],
          ),
          const SizedBox(height: 15),
          AppButton(title: 'إضافة', onPressed: () {}),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
