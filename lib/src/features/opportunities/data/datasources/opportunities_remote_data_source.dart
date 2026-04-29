import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/opportunity_model.dart';

abstract class OpportunitiesRemoteDataSource {
  Stream<List<OpportunityModel>> watchOpportunities();
}

class OpportunitiesRemoteDataSourceImpl implements OpportunitiesRemoteDataSource {
  OpportunitiesRemoteDataSourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Stream<List<OpportunityModel>> watchOpportunities() {
    return _firestore
        .collection('opportunities')
        .where('isActive', isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(OpportunityModel.fromFirestore).toList();
    });
  }
}