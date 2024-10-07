import 'package:flutter/widgets.dart';

import '../../../core/interfaces/app_controller.dart';
import '../../../core/interfaces/app_error.dart';
import '../../../data/repositories/auth_repository.dart';
import '../auth_states.dart';

class SignInController extends FormPageController<AuthState> {
  SignInController(this._repo) : super(InitialAuthState());

  final AuthRepository _repo;

  /// Controller for user's email field.
  final username = TextEditingController();

  /// Controller for user's password field.
  final password = TextEditingController();

  /// Starts the sign in call with the current values
  /// - if all the validations pass.
  Future<void> signIn() async {
    if (validateAll()) {
      try {
        emit(LoadingAuthState());
        await _repo.signIn(username: username.text, password: password.text);
        emit(SuccessAuthState());
      } on AppError catch (e) {
        emit(ErrorAuthState(e));
      }
    }
  }
}
