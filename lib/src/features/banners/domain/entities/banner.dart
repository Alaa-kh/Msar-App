import 'package:equatable/equatable.dart';

class Banner extends Equatable {
  const Banner({
    required this.id,
    required this.imageUrl,
    required this.isActive,
    required this.order,
  });

  final String id;
  final String imageUrl;
  final bool isActive;
  final int order;

  @override
  List<Object?> get props => [id, imageUrl, isActive, order];
}
