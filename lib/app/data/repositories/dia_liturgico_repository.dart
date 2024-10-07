import 'package:intl/intl.dart';

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

  Future<DiaLiturgico> getDay(DateTime day) async {
    try {
      final result = await _client.get(
        '$diaLiturgicoBaseUrl${DateFormat('dd-MM').format(day)}',
      );

      return DiaLiturgico.fromMap(result);
    } catch (e) {
      rethrow;
    }
  }
}
