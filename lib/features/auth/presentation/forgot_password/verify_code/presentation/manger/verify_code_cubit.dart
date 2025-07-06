import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit() : super(VerifyCodeInitial());

  Timer? _timer;
  int _secondsRemaining = 30;

  void verifyCode({required String email, required String code}) async {
    emit(VerifyCodeLoading());
    try {
      await Future.delayed(const Duration(seconds: 2)); // simulate API
      emit(VerifyCodeSuccess());
    } catch (e) {
      emit(VerifyCodeFailure(error: 'Invalid Code'));
    }
  }

  void resendCode({required String email}) async {
    emit(VerifyCodeLoading());
    try {
      await Future.delayed(const Duration(seconds: 2)); // simulate resend

      _startTimer(); // restart timer
      emit(VerifyCodeResent());
    } catch (e) {
      emit(VerifyCodeFailure(error: 'Failed to resend code'));
    }
  }

  void _startTimer() {
    _secondsRemaining = 30;
    _timer?.cancel();

    emit(VerifyCodeTimerUpdate(secondsRemaining: _secondsRemaining));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        _secondsRemaining--;
        emit(VerifyCodeTimerUpdate(secondsRemaining: _secondsRemaining));
      }
    });
  }

  int get secondsRemaining => _secondsRemaining;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
