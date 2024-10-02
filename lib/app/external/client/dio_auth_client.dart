import 'package:dio/dio.dart';

import 'auth_client_interface.dart';

final class DioAuthClient implements AuthClientInterface {
  DioAuthClient(this.dio) {
    _configureDio();
  }

  final Dio dio;

  void _configureDio({String? token}) {
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 15),
      baseUrl: '',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      },
    );
  }

  @override
  Future delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future signIn(Map<String, dynamic> data) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future signUp(Map<String, dynamic> data) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
