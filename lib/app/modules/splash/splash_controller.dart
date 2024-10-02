import '../../core/interfaces/app_controller.dart';
import '../../core/interfaces/app_error.dart';
import 'splash_states.dart';

const isLogged = false;

class SplashController extends AppController<SplashState> {
  SplashController() : super(LoadingSplashState());

  @override
  Future<void> initialize() async {
    emit(LoadingSplashState());
    try {
      await Future.delayed(Duration(seconds: 2));
      // TODO: implement user persistency (retrieve here)
      if (isLogged) {
        emit(LoadingSplashState());
      } else {
        emit(UnloggedSplashState());
      }
    } on AppError catch (e) {
      emit(ErrorSplashState(e));
    }
  }
}
