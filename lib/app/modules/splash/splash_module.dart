import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes/routes.dart';
import 'splash_controller.dart';
import 'splash_page.dart';

final class SplashModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(SplashController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Routes.root, child: (context) => SplashPage(Modular.get()));
  }
}
