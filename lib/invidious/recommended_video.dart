
import 'video_thumbnail.dart' as vt;

class RecommendedVideo {
  final String video_id;
  final String title;
  final List<vt.VideoThumbnail> video_thumbnails;
  final String author;
  final int length_seconds;
  final String view_count_text;

  RecommendedVideo({
    required this.video_id,
    required this.title,
    required this.video_thumbnails,
    required this.author,
    required this.length_seconds,
    required this.view_count_text,
  });
}
RecommendedVideo from_json(Map<String, dynamic> json) {
  return RecommendedVideo(
    video_id: json['videoId'],
    title: json['title'],
    video_thumbnails: (json['videoThumbnails'] as List)
        .map((item) => vt.from_json(item))
        .toList(),
    author: json['author'],
    length_seconds: json['lengthSeconds'],
    view_count_text: json['viewCountText'],
  );
}