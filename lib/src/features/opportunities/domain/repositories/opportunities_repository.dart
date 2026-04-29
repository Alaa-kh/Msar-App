import '../entities/opportunity.dart';

abstract class OpportunitiesRepository {
  Stream<List<Opportunity>> watchOpportunities();
}