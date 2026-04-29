import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/register_usecase.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase) : super(const RegisterInitial());

  final RegisterUseCase _registerUseCase;

  Future<void> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    final trimmedName = name.trim();
    final trimmedPhone = phone.trim();
    final trimmedEmail = email.trim();

    if (trimmedName.isEmpty ||
        trimmedPhone.isEmpty ||
        trimmedEmail.isEmpty ||
        password.isEmpty) {
      emit(
        const RegisterFailure(
          'الرجاء إدخال الاسم ورقم الهاتف والبريد الإلكتروني وكلمة المرور.',
        ),
      );
      return;
    }

    emit(const RegisterLoading());

    try {
      await _registerUseCase(
        name: trimmedName,
        phone: trimmedPhone,
        email: trimmedEmail,
        password: password,
      );

      emit(const RegisterSuccess());
    } on FirebaseAuthException catch (error) {
      emit(RegisterFailure(_mapFirebaseError(error)));
    } catch (_) {
      emit(const RegisterFailure('حدث خطأ أثناء إنشاء الحساب، حاول مرة أخرى.'));
    }
  }

  String _mapFirebaseError(FirebaseAuthException error) {
    switch (error.code) {
      case 'email-already-in-use':
        return 'البريد الإلكتروني مستخدم بالفعل.';
      case 'invalid-email':
        return 'صيغة البريد الإلكتروني غير صحيحة.';
      case 'weak-password':
        return 'كلمة المرور ضعيفة للغاية.';
      case 'operation-not-allowed':
        return 'يجب تفعيل Email/Password من Firebase Authentication.';
      case 'network-request-failed':
        return 'تحقق من اتصال الإنترنت.';
      default:
        return 'فشل إنشاء الحساب: ${error.message ?? error.code}';
    }
  }
}