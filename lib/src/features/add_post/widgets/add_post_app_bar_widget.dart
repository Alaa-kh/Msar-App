import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/constants/app_images.dart';

class AddPostAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AddPostAppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(Icons.arrow_back_ios).fadeUp(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.settings, color: Colors.white, size: 28).fadeUp(),
          ),
        ],
        backgroundColor: AppColors.primary,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 13.0),
          child: Image.asset(AppImages.logo, width: 117, height: 45).fadeUp(),
        ),
        centerTitle: true,
      ),
    );
  }
}
