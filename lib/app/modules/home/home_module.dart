import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes/routes.dart';
import 'home_controller.dart';
import 'home_page.dart';

final class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Routes.root, child: (context) => HomePage(Modular.get()));
  }
}
