import 'package:flutter/material.dart';
import 'package:msar/src/core/animation/motions.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/widgets/app_drawer_widget.dart';
import 'package:msar/src/features/home/views/widgets/home_all_tab_widget.dart';
import 'package:msar/src/features/home/views/widgets/home_app_bar_widget.dart';
import 'package:msar/src/features/home/views/widgets/home_men_tab_widget.dart';
import 'package:msar/src/features/home/views/widgets/home_women_tab_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        endDrawerEnableOpenDragGesture: false,
        drawerBarrierDismissible: false,
        drawer: appDrawer(context),
        backgroundColor: AppColors.primaryLight,
        appBar: HomeAppBarWidget(),
        body: TabBarView(
          children: [
            HomeAllTabWidget().fadeUp(),
            HomeMenTabWidget().fadeUp(),
            HomeWomenTabWidget().fadeUp(),
          ],
        ),
      ),
    );
  }
}
