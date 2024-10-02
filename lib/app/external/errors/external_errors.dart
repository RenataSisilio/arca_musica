import '../../core/interfaces/app_error.dart';

abstract interface class ExternalError implements AppError {}

abstract interface class CacheError implements ExternalError {}

abstract interface class ClientError implements ExternalError {}

abstract interface class LocalError implements ExternalError {}

abstract interface class PluginError implements ExternalError {}
