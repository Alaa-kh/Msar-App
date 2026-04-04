import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/constants/app_images.dart';

Drawer appDrawer(BuildContext context) {
  return Drawer(
    child: Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Align(
                alignment: AlignmentGeometry.topEnd,
                child: Icon(Icons.close, color: AppColors.grey),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(AppImages.logoColors, width: 250),
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.person, color: AppColors.primaryDark),
            title: Text(
              'مستخدم جديد',
              style: TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.phone, color: AppColors.primaryDark),
            title: Text(
              '01212134567',
              style: TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.email, color: AppColors.primaryDark),
            title: Text(
              'testtest@gmail.com',
              style: TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ListTile(
              leading: Icon(Icons.logout, color: AppColors.red),
              title: Text(
                'تسجيل الخروج',
                style: TextStyle(
                  color: AppColors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    ),
  );
}
