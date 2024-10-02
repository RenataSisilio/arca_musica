import '../../core/interfaces/app_state.dart';

sealed class AuthState implements AppState {}

final class InitialAuthState extends InitialState implements AuthState {}

final class LoadingAuthState extends LoadingState implements AuthState {}

final class SuccessAuthState extends SuccessState implements AuthState {}

final class ErrorAuthState extends ErrorState implements AuthState {
  ErrorAuthState(super.error);
}
