import 'data_errors.dart';

final class UnhandledClientTypeError implements MappingError {
  UnhandledClientTypeError({required this.modelName, required this.clientType});

  final Type modelName;
  final Type clientType;

  @override
  String get message => 'Ainda não foi feita a implementação do mapping de ${modelName.toString().toUpperCase()} para o client $clientType';
}
