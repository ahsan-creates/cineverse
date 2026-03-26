import 'package:cineverse/core/providers/tmdb_providers.dart';
import 'package:cineverse/features/search/data/models/search_filters_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_repository.g.dart';

class SearchResultItem {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final double rating;
  final String? releaseDate;
  final bool isMovie;
  final String overview;

  const SearchResultItem({
    required this.id,
    required this.title,
    this.posterPath,
    this.backdropPath,
    required this.rating,
    this.releaseDate,
    required this.isMovie,
    required this.overview,
  });

  String get posterUrl =>
      posterPath != null ? 'https://image.tmdb.org/t/p/w500$posterPath' : '';

  String get year {
    final d = releaseDate;
    return (d != null && d.length >= 4) ? d.substring(0, 4) : '';
  }

  String get formattedRating => rating.toStringAsFixed(1);

  factory SearchResultItem.fromMovieJson(Map<String, dynamic> j) =>
      SearchResultItem(
        id: j['id'] as int,
        title: (j['title'] ?? j['original_title'] ?? '') as String,
        posterPath: j['poster_path'] as String?,
        backdropPath: j['backdrop_path'] as String?,
        rating: (j['vote_average'] as num?)?.toDouble() ?? 0.0,
        releaseDate: j['release_date'] as String?,
        isMovie: true,
        overview: (j['overview'] ?? '') as String,
      );

  factory SearchResultItem.fromTvJson(Map<String, dynamic> j) =>
      SearchResultItem(
        id: j['id'] as int,
        title: (j['name'] ?? j['original_name'] ?? '') as String,
        posterPath: j['poster_path'] as String?,
        backdropPath: j['backdrop_path'] as String?,
        rating: (j['vote_average'] as num?)?.toDouble() ?? 0.0,
        releaseDate: j['first_air_date'] as String?,
        isMovie: false,
        overview: (j['overview'] ?? '') as String,
      );

  factory SearchResultItem.fromMultiJson(Map<String, dynamic> j) {
    final type = j['media_type'] as String?;
    if (type == 'movie') return SearchResultItem.fromMovieJson(j);
    return SearchResultItem.fromTvJson(j);
  }
}

@riverpod
class SearchRepository extends _$SearchRepository {
  @override
  void build() {}

  Dio get _dio => ref.read(tmdbDioProvider);

  Future<List<SearchResultItem>> search(SearchFilters filters) async {
    if (filters.query.isNotEmpty) {
      return _textSearch(filters);
    }
    return _discover(filters);
  }

  Future<List<SearchResultItem>> _textSearch(SearchFilters f) async {
    final endpoint = f.mediaType == 'tv'
        ? '/search/tv'
        : f.mediaType == 'movie'
            ? '/search/movie'
            : '/search/multi';
    final res = await _dio.get(
      endpoint,
      queryParameters: {
        'query': f.query,
        'page': f.page,
      },
    );
    final results = res.data['results'] as List;
return results.map((e) {
      final map = e as Map<String, dynamic>;
      if (f.mediaType == 'tv') return SearchResultItem.fromTvJson(map);
      if (f.mediaType == 'movie') return SearchResultItem.fromMovieJson(map);
      final type = map['media_type'];
      if (type == 'movie') return SearchResultItem.fromMovieJson(map);
      if (type == 'tv') return SearchResultItem.fromTvJson(map);
      return SearchResultItem.fromMultiJson(map);
    }).toList();
  }

  Future<List<SearchResultItem>> _discover(SearchFilters f) async {
    final isMovie = f.mediaType != 'tv';
    final endpoint = isMovie ? '/discover/movie' : '/discover/tv';
    final params = <String, dynamic>{
      'sort_by': f.sortBy,
      'page': f.page,
      if (f.genreId != null) 'with_genres': f.genreId,
      if (f.releaseYear != null && isMovie)
        'primary_release_year': f.releaseYear,
      if (f.releaseYear != null && !isMovie)
        'first_air_date_year': f.releaseYear,
      if (f.minRating > 0) 'vote_average.gte': f.minRating,
      if (f.maxRating < 10) 'vote_average.lte': f.maxRating,
    };
    final res = await _dio.get(endpoint, queryParameters: params);
    final results = res.data['results'] as List;
    return results
        .map(
          (e) => isMovie
              ? SearchResultItem.fromMovieJson(e as Map<String, dynamic>)
              : SearchResultItem.fromTvJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
