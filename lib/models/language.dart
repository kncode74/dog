class Language {
  final String? label;
  final int? value;

  Language(this.label, this.value);

  factory Language.init({
    String? label,
    int? value,
  }) {
    return Language(
      label,
      value,
    );
  }
}
