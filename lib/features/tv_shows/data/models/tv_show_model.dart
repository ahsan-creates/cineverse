import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show_model.freezed.dart';
part 'tv_show_model.g.dart';

@freezed
abstract class TvShowModel with _$TvShowModel {
  const factory TvShowModel({
    required int id,
    @JsonKey(name: 'name') required String name,
    @Default('') String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'vote_average') @Default(0.0) double voteAverage,
    @JsonKey(name: 'first_air_date') String? firstAirDate,
    @JsonKey(name: 'genre_ids') @Default([]) List<int> genreIds,
    @Default(0.0) double popularity,
    @JsonKey(name: 'original_language') @Default('en') String originalLanguage,
  }) = _TvShowModel;

  factory TvShowModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowModelFromJson(json);
}

extension TvShowModelX on TvShowModel {
  String get posterUrl => posterPath != null
      ? 'https://image.tmdb.org/t/p/w500$posterPath'
      : 'https://via.placeholder.com/500x750?text=No+Poster';

  String get backdropUrl => backdropPath != null
      ? 'https://image.tmdb.org/t/p/original$backdropPath'
      : '';

  String get formattedRating => voteAverage.toStringAsFixed(1);

  String get year => firstAirDate != null && firstAirDate!.length >= 4
      ? firstAirDate!.substring(0, 4)
      : 'N/A';
}

@freezed
abstract class TvShowDetailModel with _$TvShowDetailModel {
  const factory TvShowDetailModel({
    required int id,
    required String name,
    @Default('') String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'vote_average') @Default(0.0) double voteAverage,
    @JsonKey(name: 'first_air_date') String? firstAirDate,
    @JsonKey(name: 'number_of_seasons') @Default(0) int numberOfSeasons,
    @JsonKey(name: 'number_of_episodes') @Default(0) int numberOfEpisodes,
    @Default([]) List<TvGenreModel> genres,
    String? status,
    String? tagline,
    @JsonKey(name: 'episode_run_time') @Default([]) List<int> episodeRunTime,
  }) = _TvShowDetailModel;

  factory TvShowDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowDetailModelFromJson(json);
}

extension TvShowDetailX on TvShowDetailModel {
  String get posterUrl => posterPath != null
      ? 'https://image.tmdb.org/t/p/w500$posterPath'
      : 'https://via.placeholder.com/500x750?text=No+Poster';

  String get backdropUrl => backdropPath != null
      ? 'https://image.tmdb.org/t/p/original$backdropPath'
      : '';

  String get formattedRating => voteAverage.toStringAsFixed(1);

  String get year => firstAirDate != null && firstAirDate!.length >= 4
      ? firstAirDate!.substring(0, 4)
      : 'N/A';

  String get episodeDuration =>
      episodeRunTime.isNotEmpty ? '${episodeRunTime.first}m' : 'N/A';
}

@freezed
abstract class TvGenreModel with _$TvGenreModel {
  const factory TvGenreModel({
    required int id,
    required String name,
  }) = _TvGenreModel;

  factory TvGenreModel.fromJson(Map<String, dynamic> json) =>
      _$TvGenreModelFromJson(json);
}
