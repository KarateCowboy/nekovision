// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videoInfoHash() => r'875f921f74da450f710a86515fc8b82669a552af';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [videoInfo].
@ProviderFor(videoInfo)
const videoInfoProvider = VideoInfoFamily();

/// See also [videoInfo].
class VideoInfoFamily extends Family<AsyncValue<VideoInfo>> {
  /// See also [videoInfo].
  const VideoInfoFamily();

  /// See also [videoInfo].
  VideoInfoProvider call(
    String videoId,
  ) {
    return VideoInfoProvider(
      videoId,
    );
  }

  @override
  VideoInfoProvider getProviderOverride(
    covariant VideoInfoProvider provider,
  ) {
    return call(
      provider.videoId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'videoInfoProvider';
}

/// See also [videoInfo].
class VideoInfoProvider extends AutoDisposeFutureProvider<VideoInfo> {
  /// See also [videoInfo].
  VideoInfoProvider(
    String videoId,
  ) : this._internal(
          (ref) => videoInfo(
            ref as VideoInfoRef,
            videoId,
          ),
          from: videoInfoProvider,
          name: r'videoInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$videoInfoHash,
          dependencies: VideoInfoFamily._dependencies,
          allTransitiveDependencies: VideoInfoFamily._allTransitiveDependencies,
          videoId: videoId,
        );

  VideoInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.videoId,
  }) : super.internal();

  final String videoId;

  @override
  Override overrideWith(
    FutureOr<VideoInfo> Function(VideoInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VideoInfoProvider._internal(
        (ref) => create(ref as VideoInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        videoId: videoId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<VideoInfo> createElement() {
    return _VideoInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoInfoProvider && other.videoId == videoId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, videoId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VideoInfoRef on AutoDisposeFutureProviderRef<VideoInfo> {
  /// The parameter `videoId` of this provider.
  String get videoId;
}

class _VideoInfoProviderElement
    extends AutoDisposeFutureProviderElement<VideoInfo> with VideoInfoRef {
  _VideoInfoProviderElement(super.provider);

  @override
  String get videoId => (origin as VideoInfoProvider).videoId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
