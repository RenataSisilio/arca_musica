import '../../core/private/liturgia_api_paths.dart';
import '../../external/client/clients_export.dart';
import '../../models/dia_liturgico.dart';

final class DiaLiturgicoRepository {
  DiaLiturgicoRepository(this._client);

  final ClientInterface _client;

  Future<DiaLiturgico> getToday() async {
    try {
      final result = await _client.get(
        diaLiturgicoBaseUrl,
      );

      return DiaLiturgico.fromMap(result);
    } catch (e) {
      rethrow;
    }
  }
}
