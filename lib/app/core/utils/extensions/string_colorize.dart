import 'package:flutter/material.dart';

extension Colorize on String {
  Color toColor() => switch (this) {
        "Branco" => Colors.white,
        "Vermelho" => Colors.red,
        "Roxo" => Colors.purple,
        "Verde" => Colors.green,
        "Preto" => Colors.black,
        "Rosa" => const Color(0xFFFF00FF),
        _ => throw UnimplementedError(),
      };
}
