import 'package:flutter_test/flutter_test.dart';
import 'package:nekovision/invidious/client.dart';

const api_url  = 'inv.tux.pizza';
const smidget_freestyle_video_id = 'crEz8i6oVpI';
void main(){
  group('get_video_info', () {
    test('it returns the invidious video info', () async {
      // final result = get_video_info(api_url)(smidget_freestyle_video_id);
      // expect()


    });
  });
  test('helloInvidious returns the correct string', () {

   expect(hello_invidious(), 'Hello Invidious!');
  });
  group('from_json', () {
    test('it correctly includes the AdaptiveFormat information', () async {
      // final result = from_json(api_url)(smidget_freestyle_video_id);
      // expect(result.adaptiveFormats.length, 1);
      // expect(result.adaptiveFormats[0].height, 720);
      // expect(result.adaptiveFormats[0].width, 1280);
      // expect(result.adaptiveFormats[0].url, 'https://inv.tux.pizza/videos/crEz8i6oVpI.mp4');
      // expect(result.adaptiveFormats[0].type, 'video/mp4');
      // expect(result.adaptiveFormats[0].quality, 'high');
      // expect(result.adaptiveFormats[0].bitrate, 10000000);
      // expect(result.adaptiveFormats[0].filesize, 10000000);
    });
  });
}


