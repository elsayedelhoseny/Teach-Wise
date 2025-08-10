abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordEmailSent extends ForgotPasswordState {
  final String message;
  ForgotPasswordEmailSent(this.message);
}

class ForgotPasswordOtpVerified extends ForgotPasswordState {
  final String message;
  ForgotPasswordOtpVerified(this.message);
}

class ForgotPasswordPasswordChanged extends ForgotPasswordState {
  final String message;
  ForgotPasswordPasswordChanged(this.message);
}

class ForgotPasswordError extends ForgotPasswordState {
  final String error;
  ForgotPasswordError(this.error);
}
