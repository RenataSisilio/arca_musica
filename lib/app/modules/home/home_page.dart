import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/widgets/views/deafult_error_view.dart';
import '../../core/widgets/views/default_loading_view.dart';
import 'home_controller.dart';
import 'home_states.dart';
import 'views/success_home_view.dart';

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
              SuccessHomeState() => SuccessHomeView(state.day),
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
