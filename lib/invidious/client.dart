import 'dart:convert';

import 'author_thumbnail.dart' as at;
import 'caption.dart' as c;
import 'format_stream.dart' as fs;
import 'adaptive_format.dart' as af;
import 'video_info.dart' as vi;
import 'video_thumbnail.dart' as vtn;
import 'recommended_video.dart' as rv;

String hello_invidious() {
  return 'Hello Invidious!';
}

// Function get_video_info(api_instance) =>
//          (video_id) {
//       final results =
//       return api_instance.videos.get(video_id).then((video) {
//         return VideoInfo(title: title,
//             videoId: videoId,
//             videoThumbnails: videoThumbnails,
//             description: description,
//             descriptionHtml: descriptionHtml,
//             published: published,
//             publishedText: publishedText,
//             keywords: keywords,
//             viewCount: viewCount,
//             likeCount: likeCount,
//             dislikeCount: dislikeCount,
//             paid: paid,
//             premium: premium,
//             isFamilyFriendly: isFamilyFriendly,
//             allowedRegions: allowedRegions,
//             genre: genre,
//             genreUrl: genreUrl,
//             author: author,
//             authorId: authorId,
//             authorUrl: authorUrl,
//             authorThumbnails: authorThumbnails,
//             subCountText: subCountText,
//             lengthSeconds: lengthSeconds,
//             allowRatings: allowRatings,
//             rating: rating,
//             isListed: isListed,
//             liveNow: liveNow,
//             isUpcoming: isUpcoming,
//             adaptiveFormats: adaptiveFormats,
//             formatStreams: formatStreams,
//             captions: captions,
//             recommendedVideos: recommendedVideos);
//       });
//     };

typedef Rack = (int leftBoob, int rightBoob);

const Rack niceRack = (40, 40);

vi.VideoInfo parseVideoInfo(String jsonString) {
  final Map<String, dynamic> json = jsonDecode(jsonString);
  return from_json(json);
}

vi.VideoInfo from_json(Map<String, dynamic> json) {
  return vi.VideoInfo(
    title: json['title'],
    video_id: json['videoId'],
    video_thumbnails: List<vtn.VideoThumbnail>.from(
        json['videoThumbnails'].map((x) => vtn.from_json(x))),
    description: json['description'],
    description_html: json['descriptionHtml'],
    published: json['published'],
    published_test: json['publishedText'],
    keywords: List<String>.from(json['keywords']),
    view_count: json['viewCount'],
    like_count: json['likeCount'],
    dislike_count: json['dislikeCount'],
    paid: json['paid'],
    premium: json['premium'],
    is_family_friendly: json['isFamilyFriendly'],
    allowed_regions: List<String>.from(json['allowedRegions']),
    genre: json['genre'],
    genre_url: json['genreUrl'],
    author: json['author'],
    author_id: json['authorId'],
    author_url: json['authorUrl'],
    author_thumbnails: List<at.AuthorThumbnail>.from(
        json['authorThumbnails'].map((x) => at.from_json(x))),
    subcount_text: json['subCountText'],
    length_seconds: json['lengthSeconds'],
    allow_ratings: json['allowRatings'],
    rating: json['rating'].toDouble(),
    is_listed: json['isListed'],
    live_now: json['liveNow'],
    is_upcoming: json['isUpcoming'],
    premier_timestamp: json['premiereTimestamp'],
    hls_url: json['hlsUrl'],
    adaptive_formats: List<af.AdaptiveFormat>.from(
        json['adaptiveFormats'].map((x) => af.from_json(x))),
    format_streams: List<fs.FormatStream>.from(
        json['formatStreams'].map((x) => fs.from_json(x))),
    captions: List<c.Caption>.from(json['captions'].map((x) => c.from_json(x))),
    recommended_videos: List<rv.RecommendedVideo>.from(
        json['recommendedVideos'].map((x) => rv.from_json(x))),
  );
}
