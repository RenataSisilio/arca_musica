abstract interface class AppError implements Exception {
  AppError(this.message);

  /// A readable (translated) error description to show to the user on screen.
  final String message;
}
