// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TvShowRepository)
final tvShowRepositoryProvider = TvShowRepositoryProvider._();

final class TvShowRepositoryProvider
    extends $NotifierProvider<TvShowRepository, void> {
  TvShowRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tvShowRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tvShowRepositoryHash();

  @$internal
  @override
  TvShowRepository create() => TvShowRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$tvShowRepositoryHash() => r'63df741d6a2c545bcdec54766d774ad221f63e8f';

abstract class _$TvShowRepository extends $Notifier<void> {
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

@ProviderFor(trendingShows)
final trendingShowsProvider = TrendingShowsProvider._();

final class TrendingShowsProvider extends $FunctionalProvider<
        AsyncValue<List<TvShowModel>>,
        List<TvShowModel>,
        FutureOr<List<TvShowModel>>>
    with
        $FutureModifier<List<TvShowModel>>,
        $FutureProvider<List<TvShowModel>> {
  TrendingShowsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'trendingShowsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$trendingShowsHash();

  @$internal
  @override
  $FutureProviderElement<List<TvShowModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<TvShowModel>> create(Ref ref) {
    return trendingShows(ref);
  }
}

String _$trendingShowsHash() => r'21ec8e563126f2166ea2d9a4dcf332dc7ba9db08';

@ProviderFor(popularShows)
final popularShowsProvider = PopularShowsProvider._();

final class PopularShowsProvider extends $FunctionalProvider<
        AsyncValue<List<TvShowModel>>,
        List<TvShowModel>,
        FutureOr<List<TvShowModel>>>
    with
        $FutureModifier<List<TvShowModel>>,
        $FutureProvider<List<TvShowModel>> {
  PopularShowsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'popularShowsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$popularShowsHash();

  @$internal
  @override
  $FutureProviderElement<List<TvShowModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<TvShowModel>> create(Ref ref) {
    return popularShows(ref);
  }
}

String _$popularShowsHash() => r'0276ca96e68447b4193100ab6fbba85bc3ca6362';

@ProviderFor(onAirShows)
final onAirShowsProvider = OnAirShowsProvider._();

final class OnAirShowsProvider extends $FunctionalProvider<
        AsyncValue<List<TvShowModel>>,
        List<TvShowModel>,
        FutureOr<List<TvShowModel>>>
    with
        $FutureModifier<List<TvShowModel>>,
        $FutureProvider<List<TvShowModel>> {
  OnAirShowsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'onAirShowsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$onAirShowsHash();

  @$internal
  @override
  $FutureProviderElement<List<TvShowModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<TvShowModel>> create(Ref ref) {
    return onAirShows(ref);
  }
}

String _$onAirShowsHash() => r'd5f7deb45258c8e72e9fd08c4541ce2668488ce7';

@ProviderFor(tvShowDetail)
final tvShowDetailProvider = TvShowDetailFamily._();

final class TvShowDetailProvider extends $FunctionalProvider<
        AsyncValue<TvShowDetailModel>,
        TvShowDetailModel,
        FutureOr<TvShowDetailModel>>
    with
        $FutureModifier<TvShowDetailModel>,
        $FutureProvider<TvShowDetailModel> {
  TvShowDetailProvider._(
      {required TvShowDetailFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'tvShowDetailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tvShowDetailHash();

  @override
  String toString() {
    return r'tvShowDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TvShowDetailModel> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<TvShowDetailModel> create(Ref ref) {
    final argument = this.argument as int;
    return tvShowDetail(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TvShowDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tvShowDetailHash() => r'976ad202c2b4cd9eac79340f0d85a333cc407e30';

final class TvShowDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TvShowDetailModel>, int> {
  TvShowDetailFamily._()
      : super(
          retry: null,
          name: r'tvShowDetailProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TvShowDetailProvider call(
    int tvId,
  ) =>
      TvShowDetailProvider._(argument: tvId, from: this);

  @override
  String toString() => r'tvShowDetailProvider';
}

@ProviderFor(tvShowVideos)
final tvShowVideosProvider = TvShowVideosFamily._();

final class TvShowVideosProvider extends $FunctionalProvider<
        AsyncValue<List<VideoModel>>,
        List<VideoModel>,
        FutureOr<List<VideoModel>>>
    with $FutureModifier<List<VideoModel>>, $FutureProvider<List<VideoModel>> {
  TvShowVideosProvider._(
      {required TvShowVideosFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'tvShowVideosProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tvShowVideosHash();

  @override
  String toString() {
    return r'tvShowVideosProvider'
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
    return tvShowVideos(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TvShowVideosProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tvShowVideosHash() => r'99f01cceb44cacf32ddd42cb84c6595a6252257e';

final class TvShowVideosFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<VideoModel>>, int> {
  TvShowVideosFamily._()
      : super(
          retry: null,
          name: r'tvShowVideosProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TvShowVideosProvider call(
    int tvId,
  ) =>
      TvShowVideosProvider._(argument: tvId, from: this);

  @override
  String toString() => r'tvShowVideosProvider';
}

@ProviderFor(similarShows)
final similarShowsProvider = SimilarShowsFamily._();

final class SimilarShowsProvider extends $FunctionalProvider<
        AsyncValue<List<TvShowModel>>,
        List<TvShowModel>,
        FutureOr<List<TvShowModel>>>
    with
        $FutureModifier<List<TvShowModel>>,
        $FutureProvider<List<TvShowModel>> {
  SimilarShowsProvider._(
      {required SimilarShowsFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'similarShowsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$similarShowsHash();

  @override
  String toString() {
    return r'similarShowsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<TvShowModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<TvShowModel>> create(Ref ref) {
    final argument = this.argument as int;
    return similarShows(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SimilarShowsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$similarShowsHash() => r'0482235efc6a7e66f529af8b4ff240afc154f471';

final class SimilarShowsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<TvShowModel>>, int> {
  SimilarShowsFamily._()
      : super(
          retry: null,
          name: r'similarShowsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SimilarShowsProvider call(
    int tvId,
  ) =>
      SimilarShowsProvider._(argument: tvId, from: this);

  @override
  String toString() => r'similarShowsProvider';
}
