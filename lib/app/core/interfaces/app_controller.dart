import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import 'app_state.dart';

abstract class AppController<S extends AppState> extends Cubit<AppState> {
  /// Returns a controller with the specified initial state which extends AppState.
  ///
  /// Usually, ```initialState``` implements either ```InitialState``` or ```LoadingState```,
  /// depending of the case.
  AppController(super.initialState) {
    initialize();
  }

  /// Do all necessary initializations
  /// (usually, getting some data from clients).
  Future<void> initialize();
}

abstract class FormPageController<S extends AppState>
    extends AppController<AppState> {
  FormPageController(super.initialState);

  /// The key of the form in the page,
  /// used to validate info before sending a request.
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  /// Validates all form fields.
  /// 
  /// Returns ```true``` if all validations pass.
  bool validateAll() => formKey.currentState?.validate() ?? false;

  @override
  Future<void> initialize() async {}
}
