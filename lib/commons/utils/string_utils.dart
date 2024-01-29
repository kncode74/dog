extension StringUtil on String {
  List<String> chunk(int size) {
    var chunks = <String>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(substring(i, i + size > length ? length : i + size));
    }
    return chunks;
  }

  String getLocaleText() {
    switch (this) {
      case 'en':
        return 'English';
      case 'th':
        return 'ไทย';
      default:
        return '';
    }
  }
}

extension StringOptionalUtil on String? {
  bool isBlank() {
    return this == null || this == '';
  }
}
