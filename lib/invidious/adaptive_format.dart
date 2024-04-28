import 'package:fpdart/fpdart.dart';

final class AdaptiveFormat {
  final String index;
  final String bitrate;
  final String init;
  final String url;
  final String itag;
  final String type;
  final String clen;
  final String lmt;
  final String projection_type;
  final String container;
  final String encoding;
  final Option<String> quality_label;
  final Option<String> resolution;

  AdaptiveFormat({
    required this.index,
    required this.bitrate,
    required this.init,
    required this.url,
    required this.itag,
    required this.type,
    required this.clen,
    required this.lmt,
    required this.projection_type,
    required this.container,
    required this.encoding,
    this.quality_label = const None(),
    this.resolution = const None(),
  });
}

AdaptiveFormat from_json(Map<String, dynamic> json) {
  return AdaptiveFormat(
    index: json['index'],
    bitrate: json['bitrate'],
    init: json['init'],
    url: json['url'],
    itag: json['itag'],
    type: json['type'],
    clen: json['clen'],
    lmt: json['lmt'],
    projection_type: json['projectionType'],
    container: json['container'],
    encoding: json['encoding'],
    quality_label: Option.fromNullable(json['qualityLabel']),
    resolution: Option.fromNullable(json['resolution'])
  );
}
