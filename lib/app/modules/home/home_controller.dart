import '../../core/interfaces/app_controller.dart';
import 'home_states.dart';

class HomeController extends AppController<HomeState> {
  HomeController() : super(InitialHomeState());
  
  @override
  Future<void> initialize() {
    // TODO: implement initialize
    throw UnimplementedError();
  }
}
