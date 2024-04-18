import 'package:flutter_test/flutter_test.dart';
import 'package:nekovision/invidious/author_thumbnail.dart';

void main() {
  group('AuthorThumbnail from_json', () {
    test('correctly parses a JSON object into an AuthorThumbnail object', () {
      final Map<String, dynamic> sample_json = {
        'url': 'https://example.com/thumbnail.jpg',
        'width': 100,
        'height': 100,
      };

      final result = from_json(sample_json);

      expect(result.url, 'https://example.com/thumbnail.jpg');
      expect(result.width, 100);
      expect(result.height, 100);
    });
  });
}
