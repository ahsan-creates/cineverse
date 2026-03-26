import 'package:cineverse/features/search/data/models/search_filters_model.dart';
import 'package:cineverse/features/search/data/repositories/search_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  @override
  SearchFilters build() {
    return SearchFilters.empty();
  }

  void updateQuery(String query) {
    state = state.copyWith(query: query, page: 1);
  }

  void updateFilters(SearchFilters filters) {
    state = filters.copyWith(page: 1);
  }

  void resetFilters() {
    state = SearchFilters.empty().copyWith(query: state.query);
  }

  void nextPage() {
    state = state.copyWith(page: state.page + 1);
  }
}

@riverpod
Future<List<SearchResultItem>> searchResults(Ref ref) async {
  final filters = ref.watch(searchControllerProvider);
  if (filters.query.trim().isEmpty && !filters.hasActiveFilters) {
    return [];
  }

  // Debounce the search request
  await Future.delayed(const Duration(milliseconds: 400));

  return ref.read(searchRepositoryProvider.notifier).search(filters);
}
