import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/modules/app_module.dart';

void main() {
  runApp(
    ModularApp(module: AppModule(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: personalize theme
    return MaterialApp.router(
      title: 'Músicas Arca',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
