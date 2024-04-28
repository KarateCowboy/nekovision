import 'dart:math';
import 'package:faker/faker.dart';
import 'package:fpdart/fpdart.dart';

import 'invidious/adaptive_format.dart';
import 'invidious/author_thumbnail.dart';
import 'invidious/caption.dart';
import 'invidious/format_stream.dart';
import 'invidious/recommended_video.dart';
import 'invidious/video_info.dart';
import 'invidious/video_thumbnail.dart';

final Random random = Random();

int generateRandomInt(int max) => random.nextInt(max);

double generateRandomDouble() => random.nextDouble() * 100;

bool generateRandomBool() => random.nextBool();

List<String> generateRandomStringList(int length) =>
    List.generate(length, (_) => faker.lorem.word());

List<T> generateRandomList<T>(T Function() generator, {int length = 5}) =>
    List.generate(length, (_) => generator());

VideoInfo random_video_info() {
  final Faker faker = Faker();
  return VideoInfo(
    title: faker.lorem.words(5).join(' '),
    video_id: faker.guid.guid(),
    video_thumbnails: generateRandomList(() => random_video_thumbnail()),
    description: faker.lorem.sentences(3).join(' '),
    description_html: faker.lorem.sentences(3).join(' '),
    published: generateRandomInt(99999999),
    // Random timestamp
    published_test: faker.date.random.toString(),
    keywords: generateRandomStringList(5),
    view_count: generateRandomInt(10000),
    like_count: generateRandomInt(1000),
    dislike_count: generateRandomInt(500),
    paid: generateRandomBool(),
    premium: generateRandomBool(),
    is_family_friendly: generateRandomBool(),
    allowed_regions: generateRandomStringList(3),
    genre: faker.lorem.word(),
    genre_url: faker.internet.httpsUrl(),
    author: faker.person.name(),
    author_id: faker.guid.guid(),
    author_url: faker.internet.httpsUrl(),
    author_thumbnails: generateRandomList(() => AuthorThumbnail(
        url: faker.image.image(),
        width: generateRandomInt(1000),
        height: generateRandomInt(1000))),
    subcount_text: faker.randomGenerator.string(8),
    length_seconds: generateRandomInt(1200),
    allow_ratings: generateRandomBool(),
    rating: generateRandomDouble(),
    is_listed: generateRandomBool(),
    live_now: generateRandomBool(),
    is_upcoming: generateRandomBool(),
    premier_timestamp: Option.fromNullable(
        generateRandomBool() ? generateRandomInt(9999) : null),
    hls_url: Option.fromNullable(
        generateRandomBool() ? faker.internet.httpsUrl() : null),
    adaptive_formats: generateRandomList(() => random_adaptive_format()),
    format_streams: generateRandomList(() => random_format_stream()),
    captions: generateRandomList(() => random_caption()),
    recommended_videos: generateRandomList(() => random_recommended_video()),
  );
}

AdaptiveFormat random_adaptive_format() {
  return AdaptiveFormat(
      bitrate: faker.randomGenerator.integer(100000).toString(),
      url: faker.internet.httpsUrl(),
      index: faker.randomGenerator.integer(12).toString(),
      init: random_init(),
      itag: faker.randomGenerator.integer(999).toString(),
      type: 'video/mp4; codecs="avc1.4d4015"',
      clen: faker.randomGenerator.integer(999999).toString(),
      lmt: faker.randomGenerator.integer(99999).toString(),
      projection_type: 'RECTANGULAR',
      container: 'mp4',
      encoding: 'H.264');
}

FormatStream random_format_stream() {
  return FormatStream(
      url: faker.internet.httpsUrl(),
      itag: faker.randomGenerator.integer(999).toString(),
      type: 'video/mp4; codecs="avc1.4d4015"',
      container: 'mp4',
      resolution: '854x480',
      encoding: 'H.264',
      quality_label: '480p',
      quality: 'medium',
      size: faker.randomGenerator.integer(999999).toString());
}

Caption random_caption() {
  return Caption(
      language_code: faker.address.countryCode(),
      label: 'English',
      url: faker.internet.httpsUrl());
}

String random_init() {
  final Faker faker = Faker();
  return '${faker.randomGenerator.integer(9)}-${faker.randomGenerator.integer(99999)}';
}

RecommendedVideo random_recommended_video() {
  return RecommendedVideo(
    video_id: faker.guid.guid(),
    title: faker.lorem.words(5).join(' '),
    video_thumbnails: generateRandomList(() => random_video_thumbnail()),
    author: faker.person.name(),
    length_seconds: faker.randomGenerator.integer(1200),
    view_count_text: "${faker.randomGenerator.string(8)} views",
  );
}

VideoThumbnail random_video_thumbnail() {
  return VideoThumbnail(
    quality: 'high',
    url: faker.internet.httpsUrl(),
    width: faker.randomGenerator.integer(1000),
    height: faker.randomGenerator.integer(1000),
  );
}
