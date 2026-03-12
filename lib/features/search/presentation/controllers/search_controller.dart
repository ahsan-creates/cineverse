import 'dart:async';

import 'package:cineverse/features/search/data/models/search_filters_model.dart';
import 'package:cineverse/features/search/data/repositories/search_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  Timer? _debounce;

  @override
  SearchFilters build() {
    ref.onDispose(() => _debounce?.cancel());
    return SearchFilters.empty();
  }

  void updateQuery(String query) {
    state = state.copyWith(query: query, page: 1);
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      ref.invalidateSelf();
    });
  }

  void updateFilters(SearchFilters filters) {
    _debounce?.cancel();
    state = filters.copyWith(page: 1);
  }

  void resetFilters() {
    _debounce?.cancel();
    state = SearchFilters.empty().copyWith(query: state.query);
  }

  void nextPage() {
    _debounce?.cancel();
    state = state.copyWith(page: state.page + 1);
  }
}

@riverpod
Future<List<SearchResultItem>> searchResults(Ref ref) async {
  final filters = ref.watch(searchControllerProvider);
  if (filters.query.trim().isEmpty && !filters.hasActiveFilters) {
    return [];
  }
  return ref.read(searchRepositoryProvider.notifier).search(filters);
}
