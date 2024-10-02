import 'package:flutter/widgets.dart';

import 'routes.dart';

class NavigatorRoutes implements Routes {
  
  /// Maybe needed to provide context information.
  ///
  /// This key must be attached to the top-most "app" widget.
  final navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? get _context => navigatorKey.currentContext;

  NavigatorState get _navigator => _context == null
      ? throw '\n\nVocê provavelmente esqueceu de passar a navigatorKey para o seu AppWidget!\n\n'
      : Navigator.of(_context!);

  @override
  bool canPop() {
    _navigator.canPop();
    return true;
  }

  @override
  Future<bool> maybePop<T extends Object?>([T? result]) async {
    await _navigator.maybePop(result);
    return true;
  }

  @override
  void navigate(String path, {arguments}) {
    _navigator.pushNamed(path, arguments: arguments);
  }

  @override
  void pop<T extends Object?>([T? result]) {
    _navigator.pop(result);
  }

  @override
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigator.popAndPushNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  @override
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _navigator.pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName, {
    Object? arguments,
  }) {
    return _navigator.pushNamedAndRemoveUntil(
      newRouteName,
      (_) => true,
      arguments: arguments,
    );
  }

  @override
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigator.pushNamed(routeName, arguments: arguments);
  }
  
  @override
  T? get<T extends Object>() {
    // TODO: implement get
    throw UnimplementedError();
  }
}
