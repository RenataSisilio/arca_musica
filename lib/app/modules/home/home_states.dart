import '../../core/interfaces/app_state.dart';

sealed class HomeState implements AppState {}

final class InitialHomeState extends InitialState implements HomeState {}

final class LoadingHomeState extends LoadingState implements HomeState {}

final class SuccessHomeState extends SuccessState implements HomeState {}

final class ErrorHomeState extends ErrorState implements HomeState {
  ErrorHomeState(super.error);
}
