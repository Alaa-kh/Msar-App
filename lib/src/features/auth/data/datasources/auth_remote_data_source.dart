import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/app_user_model.dart';

abstract class AuthRemoteDataSource {
  Stream<User?> authStateChanges();

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

  Stream<AppUserModel?> watchCurrentUserProfile();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  @override
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
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
  }) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = credential.user;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'user-not-created',
        message: 'User was not created.',
      );
    }

    await user.updateDisplayName(name);

    final appUser = AppUserModel(
      id: user.uid,
      name: name,
      email: email,
      phone: phone,
      role: 'user',
    );

    await _firestore.collection('users').doc(user.uid).set(
          appUser.toCreateMap(),
        );
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.setLanguageCode('ar');
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  @override
  Stream<AppUserModel?> watchCurrentUserProfile() {
    final uid = _firebaseAuth.currentUser?.uid;

    if (uid == null) {
      return Stream.value(null);
    }

    return _firestore.collection('users').doc(uid).snapshots().map((doc) {
      if (!doc.exists) return null;
      return AppUserModel.fromFirestore(doc);
    });
  }
}