import 'package:flutter/material.dart';

class DefaultLoadingView extends StatelessWidget {
  const DefaultLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
