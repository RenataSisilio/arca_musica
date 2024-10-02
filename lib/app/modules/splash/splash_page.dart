import 'package:flutter/widgets.dart';

import '../../core/interfaces/app_page.dart';
import '../../core/routes/routes.dart';
import '../../core/utils/constants/images.dart';
import 'splash_controller.dart';
import 'splash_states.dart';

class SplashPage extends StatelessWidget {
  const SplashPage(this._controller, {super.key});

  final SplashController _controller;

  @override
  Widget build(BuildContext context) {
    return AppPage(
      _controller,
      onSuccess: () => switch (_controller.state) {
        LoggedSplashState() => Routes.i.pushReplacementNamed(Routes.home),
        _ => Routes.i.pushReplacementNamed(Routes.auth),
      },
      loadingWidget: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF3268D5), Color(0xFF4FC1FF)],
          ),
        ),
        child: Center(
          child: Image.asset(
            Images.iconBackgroundless,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
        ),
      ),
    );
  }
}
