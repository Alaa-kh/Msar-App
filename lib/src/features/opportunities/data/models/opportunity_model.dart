import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/opportunity.dart';

class OpportunityModel extends Opportunity {
  const OpportunityModel({
    required super.id,
    required super.title,
    required super.company,
    required super.description,
    required super.city,
    required super.imageUrl,
    required super.audience,
    required super.isActive,
    required super.createdAt,
    super.whatsapp,
  });

  factory OpportunityModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};

    return OpportunityModel(
      id: doc.id,
      title: data['title'] as String? ?? '',
      company: data['company'] as String? ?? '',
      description: data['description'] as String? ?? '',
      city: data['city'] as String? ?? '',
      imageUrl: data['imageUrl'] as String? ?? '',
      audience: _mapAudience(data['audience'] as String?),
      isActive: data['isActive'] as bool? ?? false,
      createdAt: _mapDate(data['createdAt']),
      whatsapp: data['whatsapp'] as String? ?? '',
    );
  }

  static OpportunityAudience _mapAudience(String? value) {
    switch (value) {
      case 'men':
        return OpportunityAudience.men;
      case 'women':
        return OpportunityAudience.women;
      case 'all':
      default:
        return OpportunityAudience.all;
    }
  }

  static DateTime _mapDate(dynamic value) {
    if (value is Timestamp) {
      return value.toDate();
    }

    return DateTime.fromMillisecondsSinceEpoch(0);
  }
}