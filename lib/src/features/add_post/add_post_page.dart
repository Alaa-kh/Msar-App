import 'package:flutter/material.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/features/add_post/widgets/add_post_app_bar_widget.dart';
import 'package:msar/src/features/add_post/widgets/add_post_form_widget.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AddPostAppBarWidget(),
      // appBar: CustomAppBarWidget(
      //   leading: Builder(
      //     builder: (context) => IconButton(
      //       icon: Icon(
      //         Icons.menu,
      //         size: 30,
      //         color: isDark
      //             ? AppColors.primaryLightColor
      //             : AppColors.primaryColor,
      //       ),
      //       onPressed: () => Scaffold.of(context).openDrawer(),
      //     ),
      //   ),
      // ),
      // drawer: homeDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AddPostFormWidget(),
        ),
      ),
    );
  }
}
