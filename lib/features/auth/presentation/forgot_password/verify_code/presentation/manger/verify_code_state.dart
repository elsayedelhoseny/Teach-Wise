abstract class VerifyCodeState {}

class VerifyCodeInitial extends VerifyCodeState {}

class VerifyCodeLoading extends VerifyCodeState {}

class VerifyCodeSuccess extends VerifyCodeState {}

class VerifyCodeResent extends VerifyCodeState {}

class VerifyCodeFailure extends VerifyCodeState {
  final String error;

  VerifyCodeFailure({required this.error});
}

class VerifyCodeTimerUpdate extends VerifyCodeState {
  final int secondsRemaining;

  VerifyCodeTimerUpdate({required this.secondsRemaining});
}
