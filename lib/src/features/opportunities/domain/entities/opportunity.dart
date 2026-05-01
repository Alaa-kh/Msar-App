enum OpportunityAudience {
  all,
  men,
  women,
}

class Opportunity {
  const Opportunity({
    required this.id,
    required this.title,
    required this.company,
    required this.description,
    required this.city,
    required this.imageUrl,
    required this.audience,
    required this.isActive,
    required this.createdAt,
    this.whatsapp = '',
  });

  final String id;
  final String title;
  final String company;
  final String description;
  final String city;
  final String imageUrl;
  final OpportunityAudience audience;
  final bool isActive;
  final DateTime createdAt;
  final String whatsapp;
}