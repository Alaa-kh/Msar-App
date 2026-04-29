import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/reset_password_usecase.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._resetPasswordUseCase)
      : super(const ForgotPasswordInitial());

  final ResetPasswordUseCase _resetPasswordUseCase;

  Future<void> sendResetEmail(String email) async {
    final trimmedEmail = email.trim();

    if (trimmedEmail.isEmpty) {
      emit(const ForgotPasswordFailure('الرجاء إدخال البريد الإلكتروني.'));
      return;
    }

    emit(const ForgotPasswordLoading());

    try {
      await _resetPasswordUseCase(trimmedEmail);

      emit(
        const ForgotPasswordSuccess(
          'إذا كان البريد مسجلاً لدينا، سيتم إرسال رابط إعادة التعيين.',
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(ForgotPasswordFailure(_mapFirebaseError(error)));
    } catch (_) {
      emit(const ForgotPasswordFailure('حدث خطأ أثناء إرسال الرابط، حاول مرة أخرى.'));
    }
  }

  String _mapFirebaseError(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return 'صيغة البريد الإلكتروني غير صحيحة.';
      case 'too-many-requests':
        return 'تم إرسال طلبات كثيرة، حاول لاحقاً.';
      case 'network-request-failed':
        return 'تحقق من اتصال الإنترنت.';
      default:
        return 'فشل إرسال الرابط: ${error.message ?? error.code}';
    }
  }
}