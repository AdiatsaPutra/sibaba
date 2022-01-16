class TentangKamiException implements Exception {
  final String message;

  TentangKamiException(this.message);

  @override
  String toString() {
    return message;
  }
}
