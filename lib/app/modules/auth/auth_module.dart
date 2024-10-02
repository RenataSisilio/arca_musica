import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes/routes.dart';
import '../../data/repositories/auth_repository.dart';
import '../app_module.dart';
import 'recovery_password/recovery_password_controller.dart';
import 'recovery_password/recovery_password_page.dart';
import 'sign_in/sign_in_controller.dart';
import 'sign_in/sign_in_page.dart';
import 'sign_up/sign_up_controller.dart';
import 'sign_up/sign_up_page.dart';

final class AuthModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(AuthRepository.new);
    i.addLazySingleton(SignInController.new);
    i.addLazySingleton(SignUpController.new);
    i.addLazySingleton(RecoveryPasswordController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Routes.root, child: (context) => SignInPage(Modular.get()));
    r.child(Routes.signIn, child: (context) => SignInPage(Modular.get()));
    r.child(Routes.signUp, child: (context) => SignUpPage(Modular.get()));
    r.child(
      Routes.recoveryPassword,
      child: (context) => RecoveryPasswordPage(Modular.get()),
    );
  }
}
