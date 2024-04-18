import 'package:flutter_test/flutter_test.dart';
import 'package:nekovision/invidious/recommended_video.dart';

void main() {
  group('RecommendedVideo from_json', () {
    test('correctly parses a JSON object into a RecommendedVideo object', () {
      final Map<String, dynamic> sample_json = {
        'videoId': 'dQw4w9WgXcQ',
        'title': 'Never Gonna Give You Up',
        'videoThumbnails': [
          {
            'quality': 'high',
            'url': 'https://example.com/thumbnail1.jpg',
            'width': 120,
            'height': 90
          },
          {
            'quality': 'high',
            'url': 'https://example.com/thumbnail2.jpg',
            'width': 320,
            'height': 180
          },
        ],
        'author': 'Rick Astley',
        'lengthSeconds': 212,
        'viewCountText': '2,147,483,647 views',
      };

      final result = from_json(sample_json);

      expect(result.video_id, 'dQw4w9WgXcQ');
      expect(result.title, 'Never Gonna Give You Up');
      expect(result.video_thumbnails.length, 2);
      expect(
          result.video_thumbnails[0].url, 'https://example.com/thumbnail1.jpg');
      expect(result.author, 'Rick Astley');
      expect(result.length_seconds, 212);
      expect(result.view_count_text, '2,147,483,647 views');
    });
  });
}
