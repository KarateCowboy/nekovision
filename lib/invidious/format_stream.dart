class FormatStream {
  final String url;
  final String itag;
  final String type;
  final String quality;
  final String container;
  final String encoding;
  final String quality_label;
  final String resolution;
  final String size;

  FormatStream({
    required this.url,
    required this.itag,
    required this.type,
    required this.quality,
    required this.container,
    required this.encoding,
    required this.quality_label,
    required this.resolution,
    required this.size,
  });
}

FormatStream from_json(Map<String, dynamic> json) {
  return FormatStream(
    url: json['url'],
    itag: json['itag'],
    type: json['type'],
    quality: json['quality'],
    container: json['container'],
    encoding: json['encoding'],
    quality_label: json['qualityLabel'],
    resolution: json['resolution'],
    size: json['size'],
  );
}
