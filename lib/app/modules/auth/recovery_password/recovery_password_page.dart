import 'package:flutter/widgets.dart';

import '../../../core/interfaces/app_page.dart';
import 'recovery_password_controller.dart';

class RecoveryPasswordPage extends StatelessWidget {
  const RecoveryPasswordPage(this._controller, {super.key});

  final RecoveryPasswordController _controller;

  @override
  Widget build(BuildContext context) {
    return AppPage(_controller, successWidget: Container());
  }
}
