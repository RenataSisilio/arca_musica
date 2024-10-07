import '../../data/repositories/dia_liturgico_repository.dart';
import 'package:bloc/bloc.dart';

import '../../core/interfaces/app_error.dart';
import 'home_states.dart';

class HomeController extends Cubit<HomeState> {
  HomeController(this._repo) : super(InitialHomeState()) {
    initialize();
  }

  final DiaLiturgicoRepository _repo;

  Future<void> initialize() async {
    emit(LoadingHomeState());
    try {
      final day = await _repo.getToday();
      emit(SuccessHomeState(day));
    } on AppError catch (e) {
      emit(ErrorHomeState(e));
    }
  }
}
