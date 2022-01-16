class KontakException implements Exception {
  final String message;

  KontakException(this.message);

  @override
  String toString() {
    return message;
  }
}
