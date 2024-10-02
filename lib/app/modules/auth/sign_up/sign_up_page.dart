import 'package:flutter/material.dart';

import '../../../core/interfaces/app_page.dart';
import '../../../core/routes/routes.dart';
import '../components/email_field.dart';
import '../components/password_field.dart';
import '../components/text_header.dart';
import '../components/username_field.dart';
import 'sign_up_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage(this._controller, {super.key});

  final SignUpController _controller;

  @override
  Widget build(BuildContext context) {
    return AppFormPage(
      _controller,
      header: const TextHeader('Cadastrar'),
      bodyElements: [
        UsernameField(key: GlobalKey(), controller: _controller.username),
        const SizedBox(height: 16),
        EmailField(key: GlobalKey(), controller: _controller.email),
        const SizedBox(height: 16),
        PasswordField(key: GlobalKey(), controller: _controller.password),
        const SizedBox(height: 16),
        PasswordField.confirm(
          key: GlobalKey(),
          onSubmitted: _controller.signUp,
          originalValueToMatch: _controller.password,
        ),
      ],
      finishButtonText: 'CRIAR CONTA',
      finishAction: _controller.signUp,
      onSuccess: () => Routes.i.pushReplacementNamed(Routes.home),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Já é cadastrado? '),
          TextButton(
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(Routes.auth + Routes.signIn),
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
