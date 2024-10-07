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
  Future delete(String endpoint, {required String id}) async {
    try {
      final response = await _dio.delete(endpoint + id);
      return response.data;
    } on DioException catch (e) {
      throw DioConnectionError(e);
    } catch (e) {
      throw UnespecifiedClientError(e);
    }
  }

  @override
  Future edit(
    String endpoint, {
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.post(endpoint + id, data: data);
      return response.data;
    } on DioException catch (e) {
      throw DioConnectionError(e);
    } catch (e) {
      throw UnespecifiedClientError(e);
    }
  }

  @override
  Future get(String endpoint, {String? id}) async {
    try {
      final response = await _dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      throw DioConnectionError(e);
    } catch (e) {
      throw UnespecifiedClientError(e);
    }
  }

  @override
  Future replace(
    String endpoint, {
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.put(endpoint + id, data: data);
      return response.data;
    } on DioException catch (e) {
      throw DioConnectionError(e);
    } catch (e) {
      throw UnespecifiedClientError(e);
    }
  }
}
