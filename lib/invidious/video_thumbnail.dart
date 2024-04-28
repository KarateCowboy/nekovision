
final class VideoThumbnail {
  final String quality;
  final String url;
  final int width;
  final int height;

  VideoThumbnail({
    required this.quality,
    required this.url,
    required this.width,
    required this.height,
  });
}

VideoThumbnail from_json(Map<String, dynamic> json) {
  return VideoThumbnail(
    quality: json['quality'],
    url: json['url'],
    width: json['width'],
    height: json['height'],
  );
}
