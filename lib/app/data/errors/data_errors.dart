import '../../core/interfaces/app_error.dart';

abstract interface class DataError implements AppError {}

abstract interface class MappingError implements DataError {}

abstract interface class RepositoryError implements DataError {}
