import 'package:flutter/widgets.dart';

import '../../../core/interfaces/app_controller.dart';
import '../../../core/interfaces/app_error.dart';
import '../../../data/repositories/auth_repository.dart';
import '../auth_states.dart';

class RecoveryPasswordController extends FormPageController<AuthState> {
  RecoveryPasswordController(this._repo) : super(InitialAuthState());

  final AuthRepository _repo;

  /// Controller for user's email field.
  final email = TextEditingController();

  /// Controller for user's new password field.
  final password = TextEditingController();

  /// Starts the reset password process.
  Future<void> resetPassword() async {
    try {
      // TODO: implement reset password complete flow
      await _repo.sendResetPasswordEmail(email.text);
    } on AppError catch (e) {
      emit(ErrorAuthState(e));
    }
  }
}
