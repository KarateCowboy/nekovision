class AuthorThumbnail {
  final String url;
  final int width;
  final int height;

  AuthorThumbnail({
    required this.url,
    required this.width,
    required this.height,
  });
}

AuthorThumbnail from_json(Map<String, dynamic> json) {
  return AuthorThumbnail(
    url: json['url'],
    width: json['width'],
    height: json['height'],
  );
}