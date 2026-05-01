import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/banner.dart';

class BannerModel extends Banner {
  const BannerModel({
    required super.id,
    required super.imageUrl,
    required super.isActive,
    required super.order,
  });

  factory BannerModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};
    var imageUrl = data['imageUrl'] as String? ?? '';
    if (imageUrl.isNotEmpty && !imageUrl.startsWith('http')) {
      imageUrl = 'https://$imageUrl';
    }
    return BannerModel(
      id: doc.id,
      imageUrl: imageUrl,
      isActive: data['isActive'] as bool? ?? false,
      order: data['order'] as int? ?? 0,
    );
  }
}
