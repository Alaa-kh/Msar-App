import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/opportunity.dart';
import '../../domain/usecases/watch_opportunities_usecase.dart';
import 'opportunities_state.dart';

class OpportunitiesCubit extends Cubit<OpportunitiesState> {
  OpportunitiesCubit(this._watchOpportunitiesUseCase)
      : super(const OpportunitiesState.initial());

  final WatchOpportunitiesUseCase _watchOpportunitiesUseCase;

  StreamSubscription<List<Opportunity>>? _subscription;

  void watchOpportunities() {
    emit(state.copyWith(status: OpportunitiesStatus.loading));

    _subscription?.cancel();
    _subscription = _watchOpportunitiesUseCase().listen(
      (opportunities) {
        emit(
          state.copyWith(
            status: OpportunitiesStatus.success,
            opportunities: opportunities,
            message: '',
          ),
        );
      },
      onError: (_) {
        emit(
          state.copyWith(
            status: OpportunitiesStatus.failure,
            message: 'حدث خطأ أثناء تحميل الفرص.',
          ),
        );
      },
    );
  }

  List<Opportunity> searchLocally(String query) {
    final normalizedQuery = query.trim().toLowerCase();

    if (normalizedQuery.isEmpty) {
      return state.opportunities;
    }

    return state.opportunities.where((opportunity) {
      final searchableText = [
        opportunity.title,
        opportunity.company,
        opportunity.description,
        opportunity.city,
      ].join(' ').toLowerCase();

      return searchableText.contains(normalizedQuery);
    }).toList();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}