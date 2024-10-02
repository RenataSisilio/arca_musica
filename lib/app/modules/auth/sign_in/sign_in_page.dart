import 'package:flutter/material.dart';

import '../../../core/interfaces/app_page.dart';
import '../../../core/routes/routes.dart';
import '../components/email_field.dart';
import '../components/password_field.dart';
import '../components/text_header.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage(this._controller, {super.key});

  final SignInController _controller;

  @override
  Widget build(BuildContext context) {
    return AppFormPage(
      _controller,
      header: const TextHeader('Entrar'),
      bodyElements: [
        EmailField(key: GlobalKey(), controller: _controller.email),
        const SizedBox(height: 16),
        PasswordField(
          key: GlobalKey(),
          controller: _controller.password,
          onSubmitted: _controller.signIn,
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => Routes.i
                .pushReplacementNamed(Routes.auth + Routes.recoveryPassword),
            child: const Text('Esqueci minha senha'),
          ),
        ),
      ],
      finishButtonText: 'ENTRAR',
      finishAction: _controller.signIn,
      onSuccess: () => Routes.i.pushReplacementNamed(Routes.home),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Ainda não possui conta? '),
          TextButton(
            onPressed: () =>
                Routes.i.pushReplacementNamed(Routes.auth + Routes.signUp),
            child: const Text('Cadastre-se'),
          ),
        ],
      ),
    );
  }
}
