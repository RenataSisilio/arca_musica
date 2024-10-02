import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/routes/routes.dart';
import '../core/widgets/views/missing_impl_view.dart';
import '../external/client/clients_export.dart';
import 'modules_export.dart';

final class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<AuthClientInterface>(ParseSdkAuthClient.new);

    i.addInstance(Dio());
    i.addLazySingleton<ClientInterface>(DioClient.new);
  }

  @override
  void routes(RouteManager r) {
    r.module(Routes.root, module: SplashModule());
    r.module(Routes.auth, module: AuthModule());
    r.module(Routes.home, module: HomeModule());

    r.child(Routes.missingImpl, child: (context) => const MissingImplView());
  }
}
