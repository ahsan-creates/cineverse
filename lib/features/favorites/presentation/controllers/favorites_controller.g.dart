// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoritesController)
final favoritesControllerProvider = FavoritesControllerProvider._();

final class FavoritesControllerProvider
    extends $NotifierProvider<FavoritesController, AsyncValue<void>> {
  FavoritesControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'favoritesControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$favoritesControllerHash();

  @$internal
  @override
  FavoritesController create() => FavoritesController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$favoritesControllerHash() =>
    r'373b5e5604502458d1abe36f564c4741462fb7b3';

abstract class _$FavoritesController extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
        AsyncValue<void>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(isFavorite)
final isFavoriteProvider = IsFavoriteFamily._();

final class IsFavoriteProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  IsFavoriteProvider._(
      {required IsFavoriteFamily super.from,
      required (
        int,
        MediaType,
      )
          super.argument})
      : super(
          retry: null,
          name: r'isFavoriteProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isFavoriteHash();

  @override
  String toString() {
    return r'isFavoriteProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as (
      int,
      MediaType,
    );
    return isFavorite(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsFavoriteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isFavoriteHash() => r'6716f454159005c5cbaf38a23503a781fac776d9';

final class IsFavoriteFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<bool>,
            (
              int,
              MediaType,
            )> {
  IsFavoriteFamily._()
      : super(
          retry: null,
          name: r'isFavoriteProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  IsFavoriteProvider call(
    int mediaId,
    MediaType type,
  ) =>
      IsFavoriteProvider._(argument: (
        mediaId,
        type,
      ), from: this);

  @override
  String toString() => r'isFavoriteProvider';
}

@ProviderFor(isInWatchlist)
final isInWatchlistProvider = IsInWatchlistFamily._();

final class IsInWatchlistProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  IsInWatchlistProvider._(
      {required IsInWatchlistFamily super.from,
      required (
        int,
        MediaType,
      )
          super.argument})
      : super(
          retry: null,
          name: r'isInWatchlistProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isInWatchlistHash();

  @override
  String toString() {
    return r'isInWatchlistProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as (
      int,
      MediaType,
    );
    return isInWatchlist(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsInWatchlistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isInWatchlistHash() => r'8c86d8ce53aeb3cd792a20fa8620b483bbee084e';

final class IsInWatchlistFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<bool>,
            (
              int,
              MediaType,
            )> {
  IsInWatchlistFamily._()
      : super(
          retry: null,
          name: r'isInWatchlistProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  IsInWatchlistProvider call(
    int mediaId,
    MediaType type,
  ) =>
      IsInWatchlistProvider._(argument: (
        mediaId,
        type,
      ), from: this);

  @override
  String toString() => r'isInWatchlistProvider';
}
