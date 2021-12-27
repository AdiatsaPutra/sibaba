extension StringExt on String {
  String compact({
    int length = 30,
    String suffix = '...',
  }) {
    if (this.length >= length) {
      final n = substring(0, length - suffix.length);
      return '$n$suffix';
    }
    return this;
  }

  String removeHTMLTag() {
    final n = replaceAll('<p>', '')
        .replaceAll('</p>', '')
        .replaceAll('&rsquo;', '\'')
        .replaceAll('&nbsp;&nbsp;&nbsp;&nbsp;', '');
    return n;
  }
}
