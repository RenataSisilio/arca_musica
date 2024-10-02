import 'app_error.dart';

abstract interface class AppState {}

abstract base class InitialState implements AppState {}

abstract base class LoadingState implements AppState {}

abstract base class SuccessState implements AppState {}

abstract base class ErrorState implements AppState {
  ErrorState(this.error);

  /// The thrown ```AppError```.
  ///
  /// It can be a ```ExternalError```, a ```DataError```,
  /// or any class that extends ```AppError```.
  final AppError error;
}
