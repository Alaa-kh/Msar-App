import 'package:equatable/equatable.dart';

import '../../domain/entities/banner.dart';

enum BannersStatus { initial, loading, success, failure }

class BannersState extends Equatable {
  const BannersState({
    this.status = BannersStatus.initial,
    this.banners = const [],
    this.message = '',
  });

  const BannersState.initial() : this();

  final BannersStatus status;
  final List<Banner> banners;
  final String message;

  BannersState copyWith({
    BannersStatus? status,
    List<Banner>? banners,
    String? message,
  }) {
    return BannersState(
      status: status ?? this.status,
      banners: banners ?? this.banners,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, banners, message];
}
