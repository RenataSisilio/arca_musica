import 'package:flutter/widgets.dart';

import '../../core/interfaces/app_page.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage(this._controller, {super.key});

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return AppPage(_controller, successWidget: Container());
  }
}
