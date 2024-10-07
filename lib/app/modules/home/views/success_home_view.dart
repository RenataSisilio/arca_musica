import 'package:flutter/material.dart';

import '../../../models/dia_liturgico.dart';
import '../components/liturgy_part.dart';

class SuccessHomeView extends StatelessWidget {
  const SuccessHomeView(this.day, {super.key});

  final DiaLiturgico day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                day.liturgia,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              LiturgyPart(
                'Oração do dia',
                day.coleta,
              ),
              LiturgyPart(
                'Primeira Leitura - ${day.primeiraLeitura.ref}',
                day.primeiraLeitura.text,
              ),
              LiturgyPart(
                'Salmo - ${day.salmo.ref}',
                day.salmo.text,
              ),
              if (day.segundaLeitura != null)
                LiturgyPart(
                  'Segunda Leitura - ${day.segundaLeitura!.ref}',
                  day.segundaLeitura!.text,
                ),
              LiturgyPart(
                'Evangelho - ${day.evangelho.ref}',
                day.evangelho.text,
              ),
              LiturgyPart(
                'Oração sobre as Oferendas',
                day.oferendas,
              ),
              LiturgyPart(
                'Oração depois da Comunhão',
                day.comunhao,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
