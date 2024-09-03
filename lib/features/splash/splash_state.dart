abstract class SplashState {}

class InitialSplashState extends SplashState {}

class LoadingSplashState extends SplashState {}

class SuccessSplashState extends SplashState {}

class ErrorSplashState extends SplashState {
  final String message;

  ErrorSplashState(this.message);
}