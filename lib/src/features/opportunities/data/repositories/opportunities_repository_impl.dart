import '../../domain/entities/opportunity.dart';
import '../../domain/repositories/opportunities_repository.dart';
import '../datasources/opportunities_remote_data_source.dart';

class OpportunitiesRepositoryImpl implements OpportunitiesRepository {
  OpportunitiesRepositoryImpl(this._remoteDataSource);

  final OpportunitiesRemoteDataSource _remoteDataSource;

  @override
  Stream<List<Opportunity>> watchOpportunities() {
    return _remoteDataSource.watchOpportunities();
  }
}