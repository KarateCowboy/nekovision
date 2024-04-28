import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import '../factory.dart' as Factory;
import 'video_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

part 'video_info_provider.g.dart';

@riverpod
Future<VideoInfo> videoInfo(VideoInfoRef ref, String videoId) async {
  final invidious_url = "https://invidious.protokolla.fi/api/v1/videos/$videoId";
  // debugPrint(invidious_url);
  final response = await http.get(Uri.parse(invidious_url));
  Map<String, dynamic> mappified = jsonDecode(response.body);
  // debugPrint(mappified.toString());
  VideoInfo video_info = from_json(mappified);
  // debugPrint(video_info.title.toString());
  return video_info; //Factory.random_video_info();
}
