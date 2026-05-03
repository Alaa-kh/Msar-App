import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginInitial());

  final LoginUseCase _loginUseCase;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final trimmedEmail = email.trim();

    if (trimmedEmail.isEmpty || password.isEmpty) {
      if (!isClosed) {
        emit(const LoginFailure('الرجاء إدخال البريد الإلكتروني وكلمة المرور.'));
      }
      return;
    }

    if (!isClosed) {
      emit(const LoginLoading());
    }

    try {
      await _loginUseCase(
        email: trimmedEmail,
        password: password,
      );

      if (!isClosed) {
        emit(const LoginSuccess());
      }
    } on FirebaseAuthException catch (error) {
      if (!isClosed) {
        emit(LoginFailure(_mapFirebaseError(error)));
      }
    } catch (_) {
      if (!isClosed) {
        emit(const LoginFailure('حدث خطأ أثناء تسجيل الدخول، حاول مرة أخرى.'));
      }
    }
  }

  String _mapFirebaseError(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return 'صيغة البريد الإلكتروني غير صحيحة.';
      case 'invalid-credential':
      case 'user-not-found':
      case 'wrong-password':
        return 'البريد الإلكتروني أو كلمة المرور غير صحيحة.';
      case 'user-disabled':
        return 'حساب المستخدم معطل.';
      case 'too-many-requests':
        return 'تمت محاولات كثيرة، حاول لاحقاً.';
      case 'network-request-failed':
        return 'تحقق من اتصال الإنترنت.';
      default:
        return 'فشل تسجيل الدخول: ${error.message ?? error.code}';
    }
  }
}