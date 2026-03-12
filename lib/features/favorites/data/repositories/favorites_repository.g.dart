// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoritesRepository)
final favoritesRepositoryProvider = FavoritesRepositoryProvider._();

final class FavoritesRepositoryProvider
    extends $NotifierProvider<FavoritesRepository, void> {
  FavoritesRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'favoritesRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$favoritesRepositoryHash();

  @$internal
  @override
  FavoritesRepository create() => FavoritesRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$favoritesRepositoryHash() =>
    r'6fee1d07cae6152fafbd7038b742745c60271422';

abstract class _$FavoritesRepository extends $Notifier<void> {
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

@ProviderFor(favoritesStream)
final favoritesStreamProvider = FavoritesStreamProvider._();

final class FavoritesStreamProvider extends $FunctionalProvider<
        AsyncValue<List<FavoriteItem>>,
        List<FavoriteItem>,
        Stream<List<FavoriteItem>>>
    with
        $FutureModifier<List<FavoriteItem>>,
        $StreamProvider<List<FavoriteItem>> {
  FavoritesStreamProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'favoritesStreamProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$favoritesStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<FavoriteItem>> $createElement(
          $ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<FavoriteItem>> create(Ref ref) {
    return favoritesStream(ref);
  }
}

String _$favoritesStreamHash() => r'cda5cbcffeef1474f2aea40ff3f4594c82421956';

@ProviderFor(watchlistStream)
final watchlistStreamProvider = WatchlistStreamProvider._();

final class WatchlistStreamProvider extends $FunctionalProvider<
        AsyncValue<List<FavoriteItem>>,
        List<FavoriteItem>,
        Stream<List<FavoriteItem>>>
    with
        $FutureModifier<List<FavoriteItem>>,
        $StreamProvider<List<FavoriteItem>> {
  WatchlistStreamProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'watchlistStreamProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$watchlistStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<FavoriteItem>> $createElement(
          $ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<FavoriteItem>> create(Ref ref) {
    return watchlistStream(ref);
  }
}

String _$watchlistStreamHash() => r'03cbb441ff3ebc8e8c1f0788ac34d2174894042d';
