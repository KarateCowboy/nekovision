import 'package:flutter_test/flutter_test.dart';
import 'package:nekovision/invidious/video_thumbnail.dart';

void main() {
  group('VideoThumbnail from_json', () {
    test('correctly parses a JSON object into a VideoThumbnail object', () {
      final Map<String, dynamic> sample_json = {
        'quality': 'high',
        'url': 'https://example.com/thumbnail.jpg',
        'width': 1280,
        'height': 720,
      };

      final result = from_json(sample_json);

      expect(result.quality, 'high');
      expect(result.url, 'https://example.com/thumbnail.jpg');
      expect(result.width, 1280);
      expect(result.height, 720);
    });
  });
}