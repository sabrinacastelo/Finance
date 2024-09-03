abstract class SignInState {}

class SignInStateInitial extends SignInState {}

class SignInStateLoading extends SignInState {}

class SignInStateError extends SignInState {
  final String message;

  SignInStateError(this.message);
}

class SignInStateSuccess extends SignInState {
  // final User user;

  // SignInStateSuccess(this.user);
}

