import '../../core/interfaces/app_state.dart';

sealed class SplashState implements AppState {}

final class LoadingSplashState extends LoadingState implements SplashState {}

final class LoggedSplashState extends SuccessState implements SplashState {}

final class UnloggedSplashState extends SuccessState implements SplashState {}

final class ErrorSplashState extends ErrorState implements SplashState {
  ErrorSplashState(super.error);
}
