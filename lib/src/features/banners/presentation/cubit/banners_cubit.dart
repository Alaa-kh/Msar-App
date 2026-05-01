import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/banner.dart';
import '../../domain/usecases/watch_banners_usecase.dart';
import 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit(this._watchBannersUseCase) : super(const BannersState.initial());

  final WatchBannersUseCase _watchBannersUseCase;

  StreamSubscription<List<Banner>>? _subscription;

  void watchBanners() {
    emit(state.copyWith(status: BannersStatus.loading));

    _subscription?.cancel();
    _subscription = _watchBannersUseCase().listen(
      (banners) {
        if (isClosed) return;
        emit(state.copyWith(
          status: BannersStatus.success,
          banners: banners,
          message: '',
        ));
      },
      onError: (error) {
        debugPrint('[BannersCubit] Firestore error: $error');
        if (isClosed) return;
        emit(state.copyWith(
          status: BannersStatus.failure,
          message: 'حدث خطأ أثناء تحميل البنرات.',
        ));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
