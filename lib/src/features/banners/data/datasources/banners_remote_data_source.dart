import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/banner_model.dart';

abstract class BannersRemoteDataSource {
  Stream<List<BannerModel>> watchBanners();
}

class BannersRemoteDataSourceImpl implements BannersRemoteDataSource {
  const BannersRemoteDataSourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Stream<List<BannerModel>> watchBanners() {
    return _firestore
        .collection('banners')
        .orderBy('order')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(BannerModel.fromFirestore)
            .where((b) => b.isActive)
            .toList());
  }
}
