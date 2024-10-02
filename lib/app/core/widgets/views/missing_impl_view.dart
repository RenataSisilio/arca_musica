import 'package:flutter/material.dart';

class MissingImplView extends StatelessWidget {
  const MissingImplView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Esta página ainda não foi implementada.',
        textAlign: TextAlign.center,
      ),
    );
  }
}
