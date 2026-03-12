// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MovieRepository)
final movieRepositoryProvider = MovieRepositoryProvider._();

final class MovieRepositoryProvider
    extends $NotifierProvider<MovieRepository, void> {
  MovieRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'movieRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$movieRepositoryHash();

  @$internal
  @override
  MovieRepository create() => MovieRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$movieRepositoryHash() => r'a57f1f1e217709b13e8c1d0ac0683be7f4d3bdb0';

abstract class _$MovieRepository extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<void, void>, void, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(trendingMovies)
final trendingMoviesProvider = TrendingMoviesProvider._();

final class TrendingMoviesProvider extends $FunctionalProvider<
        AsyncValue<List<MovieModel>>,
        List<MovieModel>,
        FutureOr<List<MovieModel>>>
    with $FutureModifier<List<MovieModel>>, $FutureProvider<List<MovieModel>> {
  TrendingMoviesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'trendingMoviesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$trendingMoviesHash();

  @$internal
  @override
  $FutureProviderElement<List<MovieModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<MovieModel>> create(Ref ref) {
    return trendingMovies(ref);
  }
}

String _$trendingMoviesHash() => r'f7bf72b689e0cd609e79e7afcf8fbb6f88c7406a';

@ProviderFor(popularMovies)
final popularMoviesProvider = PopularMoviesProvider._();

final class PopularMoviesProvider extends $FunctionalProvider<
        AsyncValue<List<MovieModel>>,
        List<MovieModel>,
        FutureOr<List<MovieModel>>>
    with $FutureModifier<List<MovieModel>>, $FutureProvider<List<MovieModel>> {
  PopularMoviesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'popularMoviesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$popularMoviesHash();

  @$internal
  @override
  $FutureProviderElement<List<MovieModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<MovieModel>> create(Ref ref) {
    return popularMovies(ref);
  }
}

String _$popularMoviesHash() => r'ae7248679b40842b7b4ac2931cc74794ff192b16';

@ProviderFor(nowPlayingMovies)
final nowPlayingMoviesProvider = NowPlayingMoviesProvider._();

final class NowPlayingMoviesProvider extends $FunctionalProvider<
        AsyncValue<List<MovieModel>>,
        List<MovieModel>,
        FutureOr<List<MovieModel>>>
    with $FutureModifier<List<MovieModel>>, $FutureProvider<List<MovieModel>> {
  NowPlayingMoviesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'nowPlayingMoviesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$nowPlayingMoviesHash();

  @$internal
  @override
  $FutureProviderElement<List<MovieModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<MovieModel>> create(Ref ref) {
    return nowPlayingMovies(ref);
  }
}

String _$nowPlayingMoviesHash() => r'405d80634d23f898a2816e79145c62a63e425848';

@ProviderFor(upcomingMovies)
final upcomingMoviesProvider = UpcomingMoviesProvider._();

final class UpcomingMoviesProvider extends $FunctionalProvider<
        AsyncValue<List<MovieModel>>,
        List<MovieModel>,
        FutureOr<List<MovieModel>>>
    with $FutureModifier<List<MovieModel>>, $FutureProvider<List<MovieModel>> {
  UpcomingMoviesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'upcomingMoviesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$upcomingMoviesHash();

  @$internal
  @override
  $FutureProviderElement<List<MovieModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<MovieModel>> create(Ref ref) {
    return upcomingMovies(ref);
  }
}

String _$upcomingMoviesHash() => r'228747767e46d8a9ad984a53c9cb18aaed281d8f';

@ProviderFor(movieDetail)
final movieDetailProvider = MovieDetailFamily._();

final class MovieDetailProvider extends $FunctionalProvider<
        AsyncValue<MovieDetailModel>,
        MovieDetailModel,
        FutureOr<MovieDetailModel>>
    with $FutureModifier<MovieDetailModel>, $FutureProvider<MovieDetailModel> {
  MovieDetailProvider._(
      {required MovieDetailFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'movieDetailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$movieDetailHash();

  @override
  String toString() {
    return r'movieDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<MovieDetailModel> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<MovieDetailModel> create(Ref ref) {
    final argument = this.argument as int;
    return movieDetail(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MovieDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieDetailHash() => r'addc59128e58f7fca77663580fcf3f347e0de9ec';

final class MovieDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<MovieDetailModel>, int> {
  MovieDetailFamily._()
      : super(
          retry: null,
          name: r'movieDetailProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  MovieDetailProvider call(
    int movieId,
  ) =>
      MovieDetailProvider._(argument: movieId, from: this);

  @override
  String toString() => r'movieDetailProvider';
}

@ProviderFor(movieVideos)
final movieVideosProvider = MovieVideosFamily._();

final class MovieVideosProvider extends $FunctionalProvider<
        AsyncValue<List<VideoModel>>,
        List<VideoModel>,
        FutureOr<List<VideoModel>>>
    with $FutureModifier<List<VideoModel>>, $FutureProvider<List<VideoModel>> {
  MovieVideosProvider._(
      {required MovieVideosFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'movieVideosProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$movieVideosHash();

  @override
  String toString() {
    return r'movieVideosProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<VideoModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<VideoModel>> create(Ref ref) {
    final argument = this.argument as int;
    return movieVideos(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MovieVideosProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieVideosHash() => r'4ab43ff56b11565b33189ebe3f6671e0cb88e036';

final class MovieVideosFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<VideoModel>>, int> {
  MovieVideosFamily._()
      : super(
          retry: null,
          name: r'movieVideosProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  MovieVideosProvider call(
    int movieId,
  ) =>
      MovieVideosProvider._(argument: movieId, from: this);

  @override
  String toString() => r'movieVideosProvider';
}

@ProviderFor(similarMovies)
final similarMoviesProvider = SimilarMoviesFamily._();

final class SimilarMoviesProvider extends $FunctionalProvider<
        AsyncValue<List<MovieModel>>,
        List<MovieModel>,
        FutureOr<List<MovieModel>>>
    with $FutureModifier<List<MovieModel>>, $FutureProvider<List<MovieModel>> {
  SimilarMoviesProvider._(
      {required SimilarMoviesFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'similarMoviesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$similarMoviesHash();

  @override
  String toString() {
    return r'similarMoviesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<MovieModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<MovieModel>> create(Ref ref) {
    final argument = this.argument as int;
    return similarMovies(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SimilarMoviesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$similarMoviesHash() => r'2487bbb41924728138d5ded8db5e28b563168f5b';

final class SimilarMoviesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<MovieModel>>, int> {
  SimilarMoviesFamily._()
      : super(
          retry: null,
          name: r'similarMoviesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SimilarMoviesProvider call(
    int movieId,
  ) =>
      SimilarMoviesProvider._(argument: movieId, from: this);

  @override
  String toString() => r'similarMoviesProvider';
}
