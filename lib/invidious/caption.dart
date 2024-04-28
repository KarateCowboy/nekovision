final class Caption {
  final String label;
  final String language_code;
  final String url;

  Caption({
    required this.label,
    required this.language_code,
    required this.url,
  });
}

Caption from_json(Map<String, dynamic> json) {
  return Caption(
    language_code: json['language_code'],
    label: json['label'],
    url: json['url'],
  );
}