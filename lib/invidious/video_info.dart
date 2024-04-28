import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'video_thumbnail.dart' as vt;

import 'adaptive_format.dart' as af;
import 'author_thumbnail.dart' as at;
import 'caption.dart' as c;
import 'format_stream.dart' as fs;
import 'recommended_video.dart' as rv;


final class VideoInfo {
  final String title;
  final String video_id;
  final List<vt.VideoThumbnail> video_thumbnails;
  final String description;
  final String description_html;
  final int published;
  final String published_test;
  final List<String> keywords;
  final int view_count;
  final int like_count;
  final int dislike_count;
  final bool paid;
  final bool premium;
  final bool is_family_friendly;
  final List<String> allowed_regions;
  final String genre;
  final String genre_url;
  final String author;
  final String author_id;
  final String author_url;
  final List<at.AuthorThumbnail> author_thumbnails;
  final String subcount_text;
  final int length_seconds;
  final bool allow_ratings;
  final double rating;
  final bool is_listed;
  final bool live_now;
  final bool is_upcoming;
  final Option<int> premier_timestamp;
  final Option<String> hls_url;
  final List<af.AdaptiveFormat> adaptive_formats;
  final List<fs.FormatStream> format_streams;
  final List<c.Caption> captions;
  final List<rv.RecommendedVideo> recommended_videos;

  VideoInfo({
    required this.title,
    required this.video_id,
    required this.video_thumbnails,
    required this.description,
    required this.description_html,
    required this.published,
    required this.published_test,
    required this.keywords,
    required this.view_count,
    required this.like_count,
    required this.dislike_count,
    required this.paid,
    required this.premium,
    required this.is_family_friendly,
    required this.allowed_regions,
    required this.genre,
    required this.genre_url,
    required this.author,
    required this.author_id,
    required this.author_url,
    required this.author_thumbnails,
    required this.subcount_text,
    required this.length_seconds,
    required this.allow_ratings,
    required this.rating,
    required this.is_listed,
    required this.live_now,
    required this.is_upcoming,
    required this.premier_timestamp,
    required this.hls_url,
    required this.adaptive_formats,
    required this.format_streams,
    required this.captions,
    required this.recommended_videos,
  });
}

VideoInfo from_json(Map<String, dynamic> json) {
  // debugPrint(json['allowedRegions'].toString());
  return VideoInfo(
    title: json['title'],
    video_id: json['videoId'],
    video_thumbnails: List<vt.VideoThumbnail>.from(json['videoThumbnails'].map((x) => vt.from_json(x))),
    description: json['description'],
    description_html: json['descriptionHtml'],
    published: json['published'],
    published_test: json['publishedText'],
    keywords: List<String>.from(json['keywords'].map((x) => x.toString())),
    view_count: json['viewCount'],
    like_count: json['likeCount'],
    dislike_count: json['dislikeCount'],
    paid: json['paid'],
    premium: json['premium'],
    is_family_friendly: json['isFamilyFriendly'],
    allowed_regions: List<String>.from(json['allowedRegions'].map((x) => x.toString())),
    genre: json['genre'],
    genre_url: json['genreUrl'],
    author: json['author'],
    author_id: json['authorId'],
    author_url: json['authorUrl'],
    author_thumbnails: List<at.AuthorThumbnail>.from(json['authorThumbnails'].map((x) => at.from_json(x))),
    subcount_text: json['subCountText'],
    length_seconds: json['lengthSeconds'],
    allow_ratings: json['allowRatings'],
    rating: json['rating'].toDouble(),
    is_listed: json['isListed'],
    live_now: json['liveNow'],
    is_upcoming: json['isUpcoming'],
    premier_timestamp: Option.fromNullable(json['premiereTimestamp']),
    hls_url: Option.fromNullable(json['hlsUrl']),
    adaptive_formats: List<af.AdaptiveFormat>.from(json['adaptiveFormats'].map((x) => af.from_json(x))),
    format_streams: List<fs.FormatStream>.from(json['formatStreams'].map((x) => fs.from_json(x))),
    captions: List<c.Caption>.from(json['captions'].map((x) => c.from_json(x))),
    recommended_videos: List<rv.RecommendedVideo>.from(json['recommendedVideos'].map((x) => rv.from_json(x))),
  );
}