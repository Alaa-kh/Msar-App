import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msar/src/core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.label, this.actions});

  final String? label;
  final Widget? actions;

  bool _isSliver(BuildContext context) {
    return context.findAncestorWidgetOfExactType<CustomScrollView>() != null ||
        context.findAncestorWidgetOfExactType<NestedScrollView>() != null;
  }

  @override
  Widget build(BuildContext context) {
    final isSliver = _isSliver(context);

    if (isSliver) {
      return SliverAppBar(
        foregroundColor: AppColors.primary,
        forceMaterialTransparency: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primaryLight,
        pinned: true,
        centerTitle: false,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            label ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.dark,
              fontSize: 18,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: actions ?? SizedBox(),
        ),
      );
    }

    return AppBar(
      forceMaterialTransparency: false,
      automaticallyImplyLeading: false,
      foregroundColor: AppColors.primary,
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: AppColors.primaryLight,
      centerTitle: false,
      title: Text(
        label ?? '',
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.dark,
          fontSize: 18,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: actions ?? SizedBox(),
      ),

      iconTheme: const IconThemeData(color: AppColors.dark),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
