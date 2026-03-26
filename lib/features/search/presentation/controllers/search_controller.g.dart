// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchController)
final searchControllerProvider = SearchControllerProvider._();

final class SearchControllerProvider
    extends $NotifierProvider<SearchController, SearchFilters> {
  SearchControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'searchControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchControllerHash();

  @$internal
  @override
  SearchController create() => SearchController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchFilters value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchFilters>(value),
    );
  }
}

String _$searchControllerHash() => r'73357b933317604ea0d205cb039b81e6f842fd9e';

abstract class _$SearchController extends $Notifier<SearchFilters> {
  SearchFilters build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SearchFilters, SearchFilters>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<SearchFilters, SearchFilters>,
        SearchFilters,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(searchResults)
final searchResultsProvider = SearchResultsProvider._();

final class SearchResultsProvider extends $FunctionalProvider<
        AsyncValue<List<SearchResultItem>>,
        List<SearchResultItem>,
        FutureOr<List<SearchResultItem>>>
    with
        $FutureModifier<List<SearchResultItem>>,
        $FutureProvider<List<SearchResultItem>> {
  SearchResultsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'searchResultsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchResultsHash();

  @$internal
  @override
  $FutureProviderElement<List<SearchResultItem>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<SearchResultItem>> create(Ref ref) {
    return searchResults(ref);
  }
}

String _$searchResultsHash() => r'428c43e9310bdad724d60cfcbd82e6d16030367b';
