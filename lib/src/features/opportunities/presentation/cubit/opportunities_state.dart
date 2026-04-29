import '../../domain/entities/opportunity.dart';

enum OpportunitiesStatus {
  initial,
  loading,
  success,
  failure,
}

class OpportunitiesState {
  const OpportunitiesState({
    required this.status,
    required this.opportunities,
    required this.message,
  });

  const OpportunitiesState.initial()
      : status = OpportunitiesStatus.initial,
        opportunities = const [],
        message = '';

  final OpportunitiesStatus status;
  final List<Opportunity> opportunities;
  final String message;

  OpportunitiesState copyWith({
    OpportunitiesStatus? status,
    List<Opportunity>? opportunities,
    String? message,
  }) {
    return OpportunitiesState(
      status: status ?? this.status,
      opportunities: opportunities ?? this.opportunities,
      message: message ?? this.message,
    );
  }

  List<Opportunity> filterByAudience(OpportunityAudience audience) {
    if (audience == OpportunityAudience.all) {
      return opportunities;
    }

    return opportunities.where((opportunity) {
      return opportunity.audience == OpportunityAudience.all ||
          opportunity.audience == audience;
    }).toList();
  }
}