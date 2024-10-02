import '../../external/client/clients_export.dart';
import '../../models/user_login_info.dart';
import '../errors/mapping_errors.dart';

extension Mapping on UserLoginInfo {
  Map<String, dynamic> toMap(AuthClientInterface client) => switch (client) {
        ParseSdkAuthClient() || DioAuthClient() => {
            'email': email,
            'password': password,
            'username': username,
          },
        _ => throw UnhandledClientTypeError(
            modelName: runtimeType,
            clientType: client.runtimeType,
          ),
      };
}
