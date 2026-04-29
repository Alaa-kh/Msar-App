import 'package:flutter/material.dart';

import '../../domain/entities/opportunity.dart';
import '../cubit/opportunities_cubit.dart';
import 'opportunity_card_widget.dart';

class OpportunitiesSearchDelegate extends SearchDelegate<Opportunity?> {
  OpportunitiesSearchDelegate(this._cubit);

  final OpportunitiesCubit _cubit;

  @override
  String get searchFieldLabel => 'ابحث عن فرصة';

  @override
  TextInputType get keyboardType => TextInputType.text;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.close),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _SearchResults(
      opportunities: _cubit.searchLocally(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _SearchResults(
      opportunities: _cubit.searchLocally(query),
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults({
    required this.opportunities,
  });

  final List<Opportunity> opportunities;

  @override
  Widget build(BuildContext context) {
    if (opportunities.isEmpty) {
      return const Center(
        child: Text('لا توجد نتائج.'),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: opportunities.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        return OpportunityCardWidget(
          opportunity: opportunities[index],
        );
      },
    );
  }
}