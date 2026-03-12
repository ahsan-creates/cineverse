import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_filters_model.freezed.dart';
part 'search_filters_model.g.dart';

@freezed
abstract class SearchFilters with _$SearchFilters {
  const factory SearchFilters({
    @Default('') String query,
    @Default('multi') String mediaType,   // multi | movie | tv
    int? genreId,
    String? genreName,
    int? releaseYear,
    @Default(0.0) double minRating,
    @Default(10.0) double maxRating,
    @Default('popularity.desc') String sortBy,
    @Default(1) int page,
  }) = _SearchFilters;

  factory SearchFilters.empty() => const SearchFilters();
  factory SearchFilters.fromJson(Map<String, dynamic> json) =>
      _$SearchFiltersFromJson(json);
}

extension SearchFiltersX on SearchFilters {
  bool get hasActiveFilters =>
      genreId != null ||
      releaseYear != null ||
      minRating > 0 ||
      maxRating < 10 ||
      sortBy != 'popularity.desc' ||
      mediaType != 'multi';

  bool get isDiscoverMode =>
      query.isEmpty && hasActiveFilters;
}

const kSortOptions = {
  'popularity.desc':     'Most Popular',
  'popularity.asc':      'Least Popular',
  'vote_average.desc':   'Highest Rated',
  'vote_average.asc':    'Lowest Rated',
  'release_date.desc':   'Newest First',
  'release_date.asc':    'Oldest First',
};

const kMovieGenres = {
  28: 'Action', 12: 'Adventure', 16: 'Animation',
  35: 'Comedy', 80: 'Crime', 99: 'Documentary',
  18: 'Drama', 10751: 'Family', 14: 'Fantasy',
  36: 'History', 27: 'Horror', 10402: 'Music',
  9648: 'Mystery', 10749: 'Romance', 878: 'Sci-Fi',
  10770: 'TV Movie', 53: 'Thriller', 10752: 'War', 37: 'Western',
};

const kTvGenres = {
  10759: 'Action & Adventure', 16: 'Animation', 35: 'Comedy',
  80: 'Crime', 99: 'Documentary', 18: 'Drama', 10751: 'Family',
  10762: 'Kids', 9648: 'Mystery', 10763: 'News',
  10764: 'Reality', 10765: 'Sci-Fi & Fantasy',
  10766: 'Soap', 10767: 'Talk', 10768: 'War & Politics', 37: 'Western',
};