import '../entities/app_user.dart';

abstract class AuthRepository {
  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  });

  Future<void> sendPasswordResetEmail(String email);

  Future<void> signOut();

  Stream<AppUser?> watchCurrentUserProfile();
}