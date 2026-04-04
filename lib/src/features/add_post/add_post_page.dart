import 'package:flutter/material.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/widgets/app_drawer_widget.dart';
import 'package:msar/src/features/add_post/widgets/add_post_app_bar_widget.dart';
import 'package:msar/src/features/add_post/widgets/add_post_form_widget.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AddPostAppBarWidget(),
      endDrawerEnableOpenDragGesture: false,
      drawerBarrierDismissible: false,
      drawer: appDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AddPostFormWidget(),
        ),
      ),
    );
  }
}
