import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msar/src/core/constants/app_colors.dart';
import 'package:msar/src/core/di/service_locator.dart';
import 'package:msar/src/core/widgets/app_drawer_widget.dart';
import 'package:msar/src/features/home/views/widgets/home_app_bar_widget.dart';
import 'package:msar/src/features/opportunities/domain/entities/opportunity.dart';
import 'package:msar/src/features/opportunities/presentation/cubit/opportunities_cubit.dart';
import 'package:msar/src/features/opportunities/presentation/widgets/opportunities_tab_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<OpportunitiesCubit>()..watchOpportunities(),
      child: const DefaultTabController(
        length: 3,
        child: Scaffold(
          endDrawerEnableOpenDragGesture: false,
          drawerBarrierDismissible: false,
          drawer: AppDrawerWidget(),
          backgroundColor: AppColors.primaryLight,
          appBar: HomeAppBarWidget(),
          body: TabBarView(
            children: [
              OpportunitiesTabWidget(audience: OpportunityAudience.all),
              OpportunitiesTabWidget(audience: OpportunityAudience.men),
              OpportunitiesTabWidget(audience: OpportunityAudience.women),
            ],
          ),
        ),
      ),
    );
  }
}