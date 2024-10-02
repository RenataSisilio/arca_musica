import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/views/deafult_error_view.dart';
import '../widgets/views/default_loading_view.dart';
import 'app_controller.dart';
import 'app_error.dart';
import 'app_state.dart';

base class AppPage extends StatelessWidget {
  const AppPage(
    this._controller, {
    super.key,
    this.initialWidget,
    this.loadingWidget,
    this.errorWidget,
    this.successWidget,
    this.onError,
    this.onSuccess,
  });

  /// State manager that extends ```AppController```
  final AppController _controller;

  /// A widget to show when the state is *INITIAL*.
  ///
  /// Defaults to ```DefaultLoadingView```
  final Widget? initialWidget;

  /// A widget to show when the state is *LOADING*.
  ///
  /// Defaults to ```DefaultLoadingView```
  final Widget? loadingWidget;

  /// A widget to show in case of *ERROR*.
  ///
  /// Defaults to ```DefaultErrorView```
  final Widget? errorWidget;

  /// A widget to show in case of *SUCCESS*.
  ///
  /// Usually a ```Scaffold```.
  ///
  /// Defaults to an empty widget.
  final Widget? successWidget;

  /// A void callback to call in case of *ERROR*.
  ///
  /// Defaults to showing a ```Snackbar``` with the error message.
  final void Function(AppError)? onError;

  /// A void callback to call in case of *SUCCESS*.
  final VoidCallback? onSuccess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _controller,
        child: BlocConsumer<AppController, AppState>(
          builder: (context, state) => switch (state) {
            InitialState() => initialWidget ?? const DefaultLoadingView(),
            LoadingState() => loadingWidget ?? const DefaultLoadingView(),
            ErrorState() => errorWidget ?? DefaultErrorView(state.error),
            SuccessState() => successWidget ?? const SizedBox.shrink(),
            _ => const SizedBox.shrink(),
          },
          listener: (context, state) => switch (state) {
            ErrorState() => onError == null
                ? _showErrorOnSnackbar(context, state)
                : onError!(state.error),
            SuccessState() => onSuccess == null ? null : onSuccess!(),
            _ => null,
          },
        ),
      ),
    );
  }

  void _showErrorOnSnackbar(BuildContext context, ErrorState state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.error.message)),
    );
  }
}

base class AppFormPage extends AppPage {
  const AppFormPage(
    FormPageController super.controller, {
    super.key,
    required this.bodyElements,
    required this.finishButtonText,
    required this.finishAction,
    this.header,
    this.footer,
    super.onError,
    super.onSuccess,
  });

  /// All the elements inside the body of the form
  /// (like inputs, labels, graphics...).
  final List<Widget> bodyElements;

  /// The text on the button that submits the form.
  final String finishButtonText;

  /// The action of the button that submits the form.
  final VoidCallback finishAction;

  /// Optional widget to show on top.
  final Widget? header;

  /// Optional widget to show under the submit button.
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    assert(_controller is FormPageController);
    final FormPageController controller = (_controller as FormPageController);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: controller.formKey,
            child: _isKeyboardOpen(context)
                ? Column(mainAxisSize: MainAxisSize.min, children: bodyElements)
                : Column(
                    children: [
                      Expanded(child: const SizedBox.shrink()),
                      if (header != null) Center(child: header!),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: bodyElements,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: BlocConsumer<AppController, AppState>(
                          bloc: _controller,
                          builder: (context, state) => switch (state) {
                            LoadingState() => Center(
                                child: Transform.scale(
                                  scale: 0.6,
                                  child: const CircularProgressIndicator(),
                                ),
                              ),
                            _ => FilledButton(
                                onPressed: finishAction,
                                child: Center(
                                  child: Text(finishButtonText),
                                ),
                              ),
                          },
                          listener: (context, state) => switch (state) {
                            ErrorState() => onError == null
                                ? _showErrorOnSnackbar(context, state)
                                : onError!(state.error),
                            SuccessState() =>
                              onSuccess == null ? null : onSuccess!(),
                            _ => null,
                          },
                        ),
                      ),
                      if (footer != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: footer!,
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  bool _isKeyboardOpen(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom != 0;
}
