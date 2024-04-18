import 'package:flutter_test/flutter_test.dart';
import 'package:nekovision/invidious/format_stream.dart'; // Adjust the import path to where your FormatStream class is defined

void main() {
  group('FormatStream from_json', () {
    test('correctly parses a JSON object into a FormatStream object', () {
      final Map<String, dynamic> sample_json = {
        'url': 'https://example.com/video.mp4',
        'itag': '133',
        'type': 'video/mp4; codecs="avc1.4d4015"',
        'quality': 'medium',
        'container': 'mp4',
        'encoding': 'H.264',
        'qualityLabel': '480p',
        'resolution': '854x480',
        'size': '200000',
      };

      final result = from_json(sample_json);

      expect(result.url, 'https://example.com/video.mp4');
      expect(result.itag, '133');
      expect(result.type, 'video/mp4; codecs="avc1.4d4015"');
      expect(result.quality, 'medium');
      expect(result.container, 'mp4');
      expect(result.encoding, 'H.264');
      expect(result.quality_label, '480p');
      expect(result.resolution, '854x480');
      expect(result.size, '200000');
    });
  });
}