import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/domain/entities/app_user.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._authRepository) : super(const ProfileInitial());

  final AuthRepository _authRepository;

  StreamSubscription<AppUser?>? _subscription;

  void watchCurrentUser() {
    emit(const ProfileLoading());

    _subscription?.cancel();
    _subscription = _authRepository.watchCurrentUserProfile().listen(
      (user) {
        if (isClosed) return;
        if (user == null) {
          emit(const ProfileFailure('لم يتم العثور على بيانات المستخدم.'));
          return;
        }

        emit(ProfileLoaded(user));
      },
      onError: (_) {
        if (isClosed) return;
        emit(const ProfileFailure('حدث خطأ أثناء تحميل بيانات المستخدم.'));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
