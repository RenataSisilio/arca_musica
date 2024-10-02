import 'dart:ui';

import 'package:intl/intl.dart';

import '../core/utils/extensions/string_colorize.dart';
import 'leitura.dart';

class DiaLiturgico {
  DiaLiturgico._({
    required this.data,
    required this.liturgia,
    required this.cor,
    required this.coleta,
    required this.oferendas,
    required this.comunhao,
    required this.primeiraLeitura,
    required this.salmo,
    this.segundaLeitura,
    required this.evangelho,
  });

  final DateTime data;

  /// Solenidade, festa, memória ou comemoração celebrada.
  final String liturgia;

  final Color cor;

  /// Oração da coleta (oração do dia).
  final String coleta;

  /// Oração sobre as oferendas.
  final String oferendas;

  /// Oração depois da comunhão.
  final String comunhao;

  final Leitura primeiraLeitura;
  final Leitura salmo;
  final Leitura? segundaLeitura;
  final Leitura evangelho;

  factory DiaLiturgico.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        "data": String date,
        "liturgia": String liturgia,
        "cor": String color,
        "dia": String coleta,
        "oferendas": String oferendas,
        "comunhao": String comunhao,
        "primeiraLeitura": Map primeiraLeitura,
        "segundaLeitura": String _,
        "salmo": Map salmo,
        "evangelho": Map evangelho,
      } =>
        DiaLiturgico._(
          data: DateFormat('DD/MM/AAAA').parse(date),
          liturgia: liturgia,
          cor: color.toColor(),
          coleta: coleta,
          oferendas: oferendas,
          comunhao: comunhao,
          primeiraLeitura:
              Leitura.fromMap(primeiraLeitura as Map<String, dynamic>),
          salmo: Leitura.fromMap(salmo as Map<String, dynamic>),
          segundaLeitura: null,
          evangelho: Leitura.fromMap(evangelho as Map<String, dynamic>),
        ),
      {
        "data": String date,
        "liturgia": String liturgia,
        "cor": String color,
        "dia": String coleta,
        "oferendas": String oferendas,
        "comunhao": String comunhao,
        "primeiraLeitura": Map primeiraLeitura,
        "segundaLeitura": Map segundaLeitura,
        "salmo": Map salmo,
        "evangelho": Map evangelho,
      } =>
        DiaLiturgico._(
          data: DateFormat('DD/MM/AAAA').parse(date),
          liturgia: liturgia,
          cor: color.toColor(),
          coleta: coleta,
          oferendas: oferendas,
          comunhao: comunhao,
          primeiraLeitura:
              Leitura.fromMap(primeiraLeitura as Map<String, dynamic>),
          salmo: Leitura.fromMap(salmo as Map<String, dynamic>),
          segundaLeitura:
              Leitura.fromMap(segundaLeitura as Map<String, dynamic>),
          evangelho: Leitura.fromMap(evangelho as Map<String, dynamic>),
        ),
      _ => throw UnimplementedError(),
    };
  }
}
