import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/constants/app_icons.dart';
import 'package:msar/src/core/constants/app_images.dart';
import 'package:msar/src/features/opportunities/presentation/cubit/opportunities_cubit.dart';
import 'package:msar/src/features/opportunities/presentation/widgets/opportunities_search_delegate.dart';
import 'package:svg_flutter/svg.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(170);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        GestureDetector(
          onTap: () {
            final cubit = context.read<OpportunitiesCubit>();
            showSearch(
              context: context,
              delegate: OpportunitiesSearchDelegate(cubit),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SvgPicture.asset(AppIcons.search, width: 30).fadeUp(),
          ),
        ),
      ],
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.settings, color: Colors.white, size: 30),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ).fadeUp(),
      toolbarHeight: 100,
      backgroundColor: AppColors.primary,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Image.asset(AppImages.logo, width: 117).fadeUp(),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          height: 55,
          margin: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: AppColors.secondary,
            ),
            tabs: [
              Tab(text: 'الكل'),
              Tab(text: 'رجال'),
              Tab(text: 'نساء'),
            ],
          ).fadeUp(),
        ),
      ),
    );
  }
}
