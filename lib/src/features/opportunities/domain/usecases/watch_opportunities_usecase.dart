import '../entities/opportunity.dart';
import '../repositories/opportunities_repository.dart';

class WatchOpportunitiesUseCase {
  WatchOpportunitiesUseCase(this._repository);

  final OpportunitiesRepository _repository;

  Stream<List<Opportunity>> call() {
    return _repository.watchOpportunities();
  }
}