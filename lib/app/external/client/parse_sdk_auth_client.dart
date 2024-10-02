import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../core/private/parse_sdk_keys.dart';
import '../errors/client_errors.dart';
import 'auth_client_interface.dart';

final class ParseSdkAuthClient implements AuthClientInterface {
  ParseSdkAuthClient() {
    Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      debug: true,
    );
  }

  @override
  Future delete() async {
    try {
      final currentUser = await ParseUser.currentUser() as ParseUser?;

      if (currentUser == null) {
        throw InvalidSessionError();
      }

      final response = await currentUser.destroy();

      return response?.result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future signIn(Map<String, dynamic> data) async {
    try {
      final user = ParseUser(
        data['username']?.trim(),
        data['password'].trim(),
        data['email']?.trim(),
      );

      ParseResponse response;

      try {
        response = await user.login();
      } catch (_) {
        final parseQuery = QueryBuilder(ParseUser.forQuery());
        final queryUserResponse = await parseQuery.query();

        if (queryUserResponse.success && queryUserResponse.results != null) {
          response = await (queryUserResponse.results as List<ParseUser>).first.login();
        } else {
          throw UserNotFoundClientError(data['email']);
        }
      }

      return response.success
          ? response.result
          : throw ParseSdkClientError(response.error!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future signOut() async {
    try {
      final currentUser = await ParseUser.currentUser() as ParseUser?;

      if (currentUser == null) {
        throw InvalidSessionError();
      }

      final response = await currentUser.logout();

      return response.result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future signUp(Map<String, dynamic> data) async {
    try {
      final user = ParseUser.createUser(
        data['username'].trim(),
        data['password'].trim(),
        data['email'].trim(),
      );

      var response = await user.signUp();

      return response.success
          ? response.result
          : throw ParseSdkClientError(response.error!);
    } catch (e) {
      rethrow;
    }
  }
}
