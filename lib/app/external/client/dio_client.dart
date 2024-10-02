import 'package:dio/dio.dart';

import '../errors/client_errors.dart';
import 'client_interface.dart';

final class DioClient implements ClientInterface {
  DioClient(this._dio);

  final Dio _dio;

  @override
  Future create(String endpoint, {required Map<String, dynamic> data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw DioConnectionError(e);
    } catch (e) {
      throw UnespecifiedClientError(e);
    }
  }

  @override
  Future delete(String endpoint, {required String id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future edit(
    String endpoint, {
    required String id,
    required Map<String, dynamic> data,
  }) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future get(String endpoint, {String? id}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future replace(
    String endpoint, {
    required String id,
    required Map<String, dynamic> data,
  }) {
    // TODO: implement replace
    throw UnimplementedError();
  }
}
