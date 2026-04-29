import '../../../auth/domain/entities/app_user.dart';

sealed class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileLoaded extends ProfileState {
  const ProfileLoaded(this.user);

  final AppUser user;
}

class ProfileFailure extends ProfileState {
  const ProfileFailure(this.message);

  final String message;
}
