// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_providers_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WatchProvidersRepository)
final watchProvidersRepositoryProvider = WatchProvidersRepositoryProvider._();

final class WatchProvidersRepositoryProvider
    extends $NotifierProvider<WatchProvidersRepository, void> {
  WatchProvidersRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'watchProvidersRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$watchProvidersRepositoryHash();

  @$internal
  @override
  WatchProvidersRepository create() => WatchProvidersRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$watchProvidersRepositoryHash() =>
    r'5c616a23318856d03cf628b665d54c366ddf8ed0';

abstract class _$WatchProvidersRepository extends $Notifier<void> {
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

@ProviderFor(movieWatchProviders)
final movieWatchProvidersProvider = MovieWatchProvidersFamily._();

final class MovieWatchProvidersProvider extends $FunctionalProvider<
        AsyncValue<WatchProviders>, WatchProviders, FutureOr<WatchProviders>>
    with $FutureModifier<WatchProviders>, $FutureProvider<WatchProviders> {
  MovieWatchProvidersProvider._(
      {required MovieWatchProvidersFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'movieWatchProvidersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$movieWatchProvidersHash();

  @override
  String toString() {
    return r'movieWatchProvidersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<WatchProviders> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<WatchProviders> create(Ref ref) {
    final argument = this.argument as int;
    return movieWatchProviders(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MovieWatchProvidersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieWatchProvidersHash() =>
    r'8c850a63529b13350ce35cd59fb3217530049534';

final class MovieWatchProvidersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<WatchProviders>, int> {
  MovieWatchProvidersFamily._()
      : super(
          retry: null,
          name: r'movieWatchProvidersProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  MovieWatchProvidersProvider call(
    int movieId,
  ) =>
      MovieWatchProvidersProvider._(argument: movieId, from: this);

  @override
  String toString() => r'movieWatchProvidersProvider';
}

@ProviderFor(tvShowWatchProviders)
final tvShowWatchProvidersProvider = TvShowWatchProvidersFamily._();

final class TvShowWatchProvidersProvider extends $FunctionalProvider<
        AsyncValue<WatchProviders>, WatchProviders, FutureOr<WatchProviders>>
    with $FutureModifier<WatchProviders>, $FutureProvider<WatchProviders> {
  TvShowWatchProvidersProvider._(
      {required TvShowWatchProvidersFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'tvShowWatchProvidersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tvShowWatchProvidersHash();

  @override
  String toString() {
    return r'tvShowWatchProvidersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<WatchProviders> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<WatchProviders> create(Ref ref) {
    final argument = this.argument as int;
    return tvShowWatchProviders(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TvShowWatchProvidersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tvShowWatchProvidersHash() =>
    r'66a5bdb32bbb036291b94e310c74df496430ea30';

final class TvShowWatchProvidersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<WatchProviders>, int> {
  TvShowWatchProvidersFamily._()
      : super(
          retry: null,
          name: r'tvShowWatchProvidersProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TvShowWatchProvidersProvider call(
    int tvId,
  ) =>
      TvShowWatchProvidersProvider._(argument: tvId, from: this);

  @override
  String toString() => r'tvShowWatchProvidersProvider';
}
