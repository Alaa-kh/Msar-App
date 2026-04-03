import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/widgets/app_text_field.dart';
import 'package:msar/src/features/add_post/widgets/add_post_button_widget.dart';
import 'package:msar/src/features/add_post/widgets/add_post_gender_widget.dart';

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
            style: TextStyle(color: AppColors.primaryDark),
          ),
          AppTextField(hint: 'أدخل عنواناً جذاباً...'),
          const SizedBox(height: 15),
          Text(
            'وصف المنشور (بالعربية)',
            style: TextStyle(color: AppColors.primaryDark),
          ),
          AppTextField(
            maxLines: 7,
            minLines: 1,
            hint: 'اكتب تفاصيل المنشور هنا...',
          ),
          const SizedBox(height: 15),
          Text('رقم الواتساب', style: TextStyle(color: AppColors.primaryDark)),
          AppTextField(
            hint: 'أدخل رقم الواتساب هنا...',
            keyboardType: TextInputType.phone,
            formatter: [
              FilteringTextInputFormatter.allow(RegExp(r'^\+?[0-9]*$')),
            ],
          ),
          const SizedBox(height: 10),
          Text('الجنس المختار', style: TextStyle(color: AppColors.primaryDark)),
          const SizedBox(height: 15),
          AddPostGenderWidget(),
          const SizedBox(height: 22),
          Center(
            child: Text(
              'التفاصيل بالانكليزية',
              style: TextStyle(
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 22),
          Text(
            'عنوان المنشور (بالانكليزية)',
            style: TextStyle(color: AppColors.primaryDark),
          ),
          AppTextField(hint: 'أدخل عنواناً جذاباً...'),
          const SizedBox(height: 15),
          Text(
            'وصف المنشور (بالانكليزية)',
            style: TextStyle(color: AppColors.primaryDark),
          ),
          AppTextField(
            maxLines: 7,
            minLines: 1,
            hint: 'اكتب تفاصيل المنشور هنا...',
          ),
          const SizedBox(height: 15),
          AddPostButtonWidget(),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
