import 'package:arca_musica/app/models/dia_liturgico.dart';

import '../../core/interfaces/app_state.dart';

sealed class HomeState implements AppState {}

final class InitialHomeState extends InitialState implements HomeState {}

final class LoadingHomeState extends LoadingState implements HomeState {}

final class SuccessHomeState extends SuccessState implements HomeState {
  SuccessHomeState(this.day);

  final DiaLiturgico day;
}

final class ErrorHomeState extends ErrorState implements HomeState {
  ErrorHomeState(super.error);
}
