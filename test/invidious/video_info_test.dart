import 'package:flutter_test/flutter_test.dart';
import 'package:nekovision/invidious/video_info.dart'; // Adjust the import path to where your VideoInfo class is defined
import 'package:fpdart/fpdart.dart';

void main() {
  group('VideoInfo from_json', () {
    test('correctly parses a JSON object into a VideoInfo object', () {
      final Map<String, dynamic> mockJson = {
        'title': 'Test Video',
        'videoId': 'xyz123',
        'videoThumbnails': [
          {
            'quality': 'high',
            'url': 'https://example.com/thumbnail.jpg',
            'width': 1280,
            'height': 720,
          },
        ],
        'description': 'A test video description',
        'descriptionHtml': '<p>A test video description</p>',
        'published': 1234567890,
        'publishedText': '1 year ago',
        'keywords': ['test', 'video'],
        'viewCount': 1000,
        'likeCount': 100,
        'dislikeCount': 5,
        'paid': false,
        'premium': false,
        'isFamilyFriendly': true,
        'allowedRegions': ['US', 'CA'],
        'genre': 'Test Genre',
        'genreUrl': 'https://example.com/genre',
        'author': 'Test Author',
        'authorId': 'author123',
        'authorUrl': 'https://example.com/author',
        'authorThumbnails': [
          {
            'url': 'https://example.com/author_thumbnail.jpg',
            'width': 100,
            'height': 100,
          },
        ],
        'subCountText': '1000 subscribers',
        'lengthSeconds': 300,
        'allowRatings': true,
        'rating': 4.5,
        'isListed': true,
        'liveNow': false,
        'isUpcoming': false,
        'premiereTimestamp': null,
        'hlsUrl': null,
        'adaptiveFormats': [],
        'formatStreams': [],
        'captions': [],
        'recommendedVideos': [],
      };

      final videoInfo = from_json(mockJson);

      expect(videoInfo.title, 'Test Video');
      expect(videoInfo.video_id, 'xyz123');
      expect(videoInfo.video_thumbnails.length, 1);
      expect(videoInfo.video_thumbnails.first.url,
          'https://example.com/thumbnail.jpg');
      expect(videoInfo.description, 'A test video description');
      expect(videoInfo.description_html, '<p>A test video description</p>');
      expect(videoInfo.published, 1234567890);
      expect(videoInfo.published_test, '1 year ago');
      expect(videoInfo.keywords, equals(['test', 'video']));
      expect(videoInfo.view_count, 1000);
      expect(videoInfo.like_count, 100);
      expect(videoInfo.dislike_count, 5);
      expect(videoInfo.paid, false);
      expect(videoInfo.premium, false);
      expect(videoInfo.is_family_friendly, true);
      expect(videoInfo.allowed_regions, equals(['US', 'CA']));
      expect(videoInfo.genre, 'Test Genre');
      expect(videoInfo.genre_url, 'https://example.com/genre');
      expect(videoInfo.author, 'Test Author');
      expect(videoInfo.author_id, 'author123');
      expect(videoInfo.author_url, 'https://example.com/author');
      expect(videoInfo.author_thumbnails.length, 1);
      expect(videoInfo.author_thumbnails.first.url,
          'https://example.com/author_thumbnail.jpg');
      expect(videoInfo.subcount_text, '1000 subscribers');
      expect(videoInfo.length_seconds, 300);
      expect(videoInfo.allow_ratings, true);
      expect(videoInfo.rating, 4.5);
      expect(videoInfo.is_listed, true);
      expect(videoInfo.live_now, false);
      expect(videoInfo.is_upcoming, false);
      expect(videoInfo.premier_timestamp, None());
      expect(videoInfo.hls_url, None());
      expect(videoInfo.adaptive_formats.length, 0);
      expect(videoInfo.format_streams.length, 0);
      expect(videoInfo.captions.length, 0);
      expect(videoInfo.recommended_videos.length, 0);
    });
  });
}
