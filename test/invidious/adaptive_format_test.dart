import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nekovision/invidious/adaptive_format.dart';

const api_url = 'inv.tux.pizza';
const smidget_freestyle_video_id = 'crEz8i6oVpI';

void main() {
  group('from_json', () {
    test('correctly parses a JSON object into an AdaptiveFormat object', () {
      // Sample JSON object that matches the structure expected by the from_json function
      final Map<String, dynamic> sample_json = {
        'index': '1',
        'bitrate': '150',
        'init': '0-65535',
        'url': 'https://example.com/video.mp4',
        'itag': '133',
        'type': 'video/mp4; codecs="avc1.4d4015"',
        'clen': '100000',
        'lmt': '1600000000',
        'projectionType': 0,
        'container': 'mp4',
        'encoding': 'H.264',
        'qualityLabel': '240p',
        'resolution': '426x240',
      };

      // Call the from_json function with the sample JSON object
      final result = from_json(sample_json);

      expect(result.index, '1');
      expect(result.bitrate, '150');
      expect(result.init, '0-65535');
      expect(result.url, 'https://example.com/video.mp4');
      expect(result.itag, '133');
      expect(result.type, 'video/mp4; codecs="avc1.4d4015"');
      expect(result.clen, '100000');
      expect(result.lmt, '1600000000');
      expect(result.projection_type, 0);
      expect(result.container, 'mp4');
      expect(result.encoding, 'H.264');
      expect(result.quality_label.getOrElse(() => ''), '240p');
      expect(result.resolution.getOrElse(() => ''), '426x240');
    });
  });
}
