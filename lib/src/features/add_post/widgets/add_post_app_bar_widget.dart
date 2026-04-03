import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/constants/app_icons.dart';
import 'package:msar/src/core/constants/app_images.dart';
import 'package:svg_flutter/svg.dart';

class AddPostAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AddPostAppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.settings,
        color: Colors.white,
        size: 30,
      ).fadeUp(),
      backgroundColor: AppColors.primary,
      title: Image.asset(AppImages.logo, width: 117, height: 45).fadeUp(),
      centerTitle: true,
    );
  }
}
