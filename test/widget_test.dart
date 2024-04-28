// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nekovision/main.dart';

void main() {
  group('SearchItemListTile', () {
    testWidgets('searchItemListTile should handle tap callback',
        (WidgetTester tester) async {

      // Override the NetworkImage to provide the local test image.
      bool wasTapped = false;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: searchItemListTile(
            thumbnailUrl: 'assets/test_image.png',
            title: 'Test Video Title',
            channel: 'Test Channel',
            viewCount: '1M views',
            timestamp: '1 year ago',
            additionalInfo: 'Test Additional Info',
            onTap: () {
              wasTapped = true;
            },
          ),
        ),
      ));

      // Perform a tap on the ListTile.
      await tester.tap(find.byType(ListTile));
      await tester.pump(); // Rebuild the widget after the state change.

      // Verify that the onTap callback was called.
      expect(wasTapped, isTrue);
    }, skip: true);
    testWidgets('searchItemListTile should display correct texts and image',
        (WidgetTester tester) async {

      // Define the test parameters.
      const String testThumbnailUrl = 'assets/test_image.png';
      const String testTitle = 'Test Video Title';
      const String testChannel = 'Test Channel';
      const String testViewCount = '1M views';
      const String testTimestamp = '1 year ago';
      const String testAdditionalInfo = 'Test Additional Info';

      // Build our widget and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: searchItemListTile(
            thumbnailUrl: testThumbnailUrl,
            title: testTitle,
            channel: testChannel,
            viewCount: testViewCount,
            timestamp: testTimestamp,
            additionalInfo: testAdditionalInfo,
            onTap: () {}, // Empty function for the test
          ),
        ),
      ));

      // Verify that the ListTile contains the expected texts.
      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testChannel), findsOneWidget);
      expect(find.text('$testViewCount • $testTimestamp'), findsOneWidget);
      expect(find.text(testAdditionalInfo), findsOneWidget);

      // Verify that the ListTile contains an image with the correct thumbnailUrl.
      expect(find.byType(Image), findsOneWidget);
      final Image image = tester.widget(find.byType(Image));
      expect(image.image, isA<NetworkImage>());
      final NetworkImage networkImage = image.image as NetworkImage;
      expect(networkImage.url, equals(testThumbnailUrl));
    }, skip: true);
  });
}
