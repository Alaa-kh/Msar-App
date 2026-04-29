import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msar/src/features/opportunities/domain/entities/opportunity.dart';
import 'package:msar/src/features/opportunities/presentation/cubit/opportunities_cubit.dart';
import 'package:msar/src/features/opportunities/presentation/cubit/opportunities_state.dart';

import 'opportunity_card_widget.dart';

class OpportunitiesTabWidget extends StatelessWidget {
  const OpportunitiesTabWidget({
    super.key,
    required this.audience,
  });

  final OpportunityAudience audience;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OpportunitiesCubit, OpportunitiesState>(
      builder: (context, state) {
        if (state.status == OpportunitiesStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == OpportunitiesStatus.failure) {
          return Center(
            child: Text(
              state.message,
              textAlign: TextAlign.center,
            ),
          );
        }

        final opportunities = state.filterByAudience(audience);

        if (opportunities.isEmpty) {
          return const Center(
            child: Text('لا توجد فرص متاحة حالياً.'),
          );
        }

        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 14)),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList.separated(
                itemCount: opportunities.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  return OpportunityCardWidget(
                    opportunity: opportunities[index],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}