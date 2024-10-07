import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/widgets/views/deafult_error_view.dart';
import '../../core/widgets/views/default_loading_view.dart';
import 'home_controller.dart';
import 'home_states.dart';

class HomePage extends StatelessWidget {
  const HomePage(this._controller, {super.key});

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    _controller.initialize();
    return BlocProvider(
      create: (context) => _controller,
      child: BlocConsumer<HomeController, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: switch (state) {
              SuccessHomeState() => AppBar(
                  title: Text(DateFormat('dd/MM/yyyy').format(state.day.data)),
                  backgroundColor: state.day.cor,
                  centerTitle: true,
                ),
              _ => null,
            },
            body: switch (state) {
              InitialHomeState() => const DefaultLoadingView(),
              LoadingHomeState() => const DefaultLoadingView(),
              ErrorHomeState() => DefaultErrorView(state.error),
              SuccessHomeState() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state.day.liturgia,
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          LiturgyPart(
                            'Oração do dia',
                            state.day.coleta,
                          ),
                          LiturgyPart(
                            'Primeira Leitura - ${state.day.primeiraLeitura.ref}',
                            state.day.primeiraLeitura.text,
                          ),
                          LiturgyPart(
                            'Salmo - ${state.day.salmo.ref}',
                            state.day.salmo.text,
                          ),
                          if (state.day.segundaLeitura != null)
                            LiturgyPart(
                              'Segunda Leitura - ${state.day.segundaLeitura!.ref}',
                              state.day.segundaLeitura!.text,
                            ),
                          LiturgyPart(
                            'Evangelho - ${state.day.evangelho.ref}',
                            state.day.evangelho.text,
                          ),
                          LiturgyPart(
                            'Oração sobre as Oferendas',
                            state.day.oferendas,
                          ),
                          LiturgyPart(
                            'Oração depois da Comunhão',
                            state.day.comunhao,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            },
          );
        },
        listener: (context, state) => switch (state) {
          ErrorHomeState() => _showErrorOnSnackbar(context, state),
          _ => null,
        },
      ),
    );
  }

  void _showErrorOnSnackbar(BuildContext context, ErrorHomeState state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.error.message)),
    );
  }
}

class LiturgyPart extends StatelessWidget {
  const LiturgyPart(
    this.label,
    this.content, {
    super.key,
  });

  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              ...content.split('').map(
                    (e) => TextSpan(
                      text: e,
                      style: e.contains(RegExp('[0-9]'))
                          ? TextStyle(
                              fontSize: 8,
                              fontFeatures: [FontFeature.superscripts()],
                            )
                          : null,
                    ),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
