import 'package:flutter/widgets.dart';

import '../../interfaces/app_error.dart';

class DefaultErrorView extends StatelessWidget {
  const DefaultErrorView(this.error, {super.key});

  final AppError error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error.message,
        textAlign: TextAlign.center,
      ),
    );
  }
}
