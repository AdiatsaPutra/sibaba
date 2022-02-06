class AdminException implements Exception {
  final String message;

  AdminException(this.message);

  @override
  String toString() {
    return message;
  }
}
