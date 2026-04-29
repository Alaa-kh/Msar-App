import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) {
    return _remoteDataSource.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    return _remoteDataSource.register(
      name: name,
      phone: phone,
      email: email,
      password: password,
    );
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    return _remoteDataSource.sendPasswordResetEmail(email);
  }

  @override
  Future<void> signOut() {
    return _remoteDataSource.signOut();
  }

  @override
  Stream<AppUser?> watchCurrentUserProfile() {
    return _remoteDataSource.watchCurrentUserProfile();
  }
}