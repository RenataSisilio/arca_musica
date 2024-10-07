import 'package:flutter/widgets.dart';

import '../../../core/interfaces/app_controller.dart';
import '../../../core/interfaces/app_error.dart';
import '../../../data/repositories/auth_repository.dart';
import '../auth_states.dart';

class SignUpController extends FormPageController<AuthState> {
  SignUpController(this._repo) : super(InitialAuthState());

  final AuthRepository _repo;

  /// Controller for user's username field.
  final username = TextEditingController();

  /// Controller for user's email field.
  final email = TextEditingController();

  /// Controller for user's password field.
  final password = TextEditingController();

  /// Starts the sign up call with the current values
  /// - if all the validations pass.
  Future<void> signUp() async {
    if (validateAll()) {
      try {
        emit(LoadingAuthState());
        await _repo.signUp(
          email: email.text,
          password: password.text,
          username: username.text,
        );
        await _repo.signUp(email: email.text, password: password.text, username: username.text);
        emit(SuccessAuthState());
      } on AppError catch (e) {
        emit(ErrorAuthState(e));
      }
    }
  }
}
