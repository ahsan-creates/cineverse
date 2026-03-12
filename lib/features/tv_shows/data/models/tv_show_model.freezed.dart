// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_show_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TvShowModel {
  int get id;
  @JsonKey(name: 'name')
  String get name;
  String get overview;
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @JsonKey(name: 'first_air_date')
  String? get firstAirDate;
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds;
  double get popularity;
  @JsonKey(name: 'original_language')
  String get originalLanguage;

  /// Create a copy of TvShowModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TvShowModelCopyWith<TvShowModel> get copyWith =>
      _$TvShowModelCopyWithImpl<TvShowModel>(this as TvShowModel, _$identity);

  /// Serializes this TvShowModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TvShowModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.firstAirDate, firstAirDate) ||
                other.firstAirDate == firstAirDate) &&
            const DeepCollectionEquality().equals(other.genreIds, genreIds) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      overview,
      posterPath,
      backdropPath,
      voteAverage,
      firstAirDate,
      const DeepCollectionEquality().hash(genreIds),
      popularity,
      originalLanguage);

  @override
  String toString() {
    return 'TvShowModel(id: $id, name: $name, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, firstAirDate: $firstAirDate, genreIds: $genreIds, popularity: $popularity, originalLanguage: $originalLanguage)';
  }
}

/// @nodoc
abstract mixin class $TvShowModelCopyWith<$Res> {
  factory $TvShowModelCopyWith(
          TvShowModel value, $Res Function(TvShowModel) _then) =
      _$TvShowModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name') String name,
      String overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'first_air_date') String? firstAirDate,
      @JsonKey(name: 'genre_ids') List<int> genreIds,
      double popularity,
      @JsonKey(name: 'original_language') String originalLanguage});
}

/// @nodoc
class _$TvShowModelCopyWithImpl<$Res> implements $TvShowModelCopyWith<$Res> {
  _$TvShowModelCopyWithImpl(this._self, this._then);

  final TvShowModel _self;
  final $Res Function(TvShowModel) _then;

  /// Create a copy of TvShowModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? voteAverage = null,
    Object? firstAirDate = freezed,
    Object? genreIds = null,
    Object? popularity = null,
    Object? originalLanguage = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _self.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _self.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _self.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: null == voteAverage
          ? _self.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      firstAirDate: freezed == firstAirDate
          ? _self.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: null == genreIds
          ? _self.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      popularity: null == popularity
          ? _self.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      originalLanguage: null == originalLanguage
          ? _self.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [TvShowModel].
extension TvShowModelPatterns on TvShowModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TvShowModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvShowModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TvShowModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvShowModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TvShowModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvShowModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            @JsonKey(name: 'name') String name,
            String overview,
            @JsonKey(name: 'poster_path') String? posterPath,
            @JsonKey(name: 'backdrop_path') String? backdropPath,
            @JsonKey(name: 'vote_average') double voteAverage,
            @JsonKey(name: 'first_air_date') String? firstAirDate,
            @JsonKey(name: 'genre_ids') List<int> genreIds,
            double popularity,
            @JsonKey(name: 'original_language') String originalLanguage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvShowModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.overview,
            _that.posterPath,
            _that.backdropPath,
            _that.voteAverage,
            _that.firstAirDate,
            _that.genreIds,
            _that.popularity,
            _that.originalLanguage);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            @JsonKey(name: 'name') String name,
            String overview,
            @JsonKey(name: 'poster_path') String? posterPath,
            @JsonKey(name: 'backdrop_path') String? backdropPath,
            @JsonKey(name: 'vote_average') double voteAverage,
            @JsonKey(name: 'first_air_date') String? firstAirDate,
            @JsonKey(name: 'genre_ids') List<int> genreIds,
            double popularity,
            @JsonKey(name: 'original_language') String originalLanguage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvShowModel():
        return $default(
            _that.id,
            _that.name,
            _that.overview,
            _that.posterPath,
            _that.backdropPath,
            _that.voteAverage,
            _that.firstAirDate,
            _that.genreIds,
            _that.popularity,
            _that.originalLanguage);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            @JsonKey(name: 'name') String name,
            String overview,
            @JsonKey(name: 'poster_path') String? posterPath,
            @JsonKey(name: 'backdrop_path') String? backdropPath,
            @JsonKey(name: 'vote_average') double voteAverage,
            @JsonKey(name: 'first_air_date') String? firstAirDate,
            @JsonKey(name: 'genre_ids') List<int> genreIds,
            double popularity,
            @JsonKey(name: 'original_language') String originalLanguage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvShowModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.overview,
            _that.posterPath,
            _that.backdropPath,
            _that.voteAverage,
            _that.firstAirDate,
            _that.genreIds,
            _that.popularity,
            _that.originalLanguage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TvShowModel implements TvShowModel {
  const _TvShowModel(
      {required this.id,
      @JsonKey(name: 'name') required this.name,
      this.overview = '',
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'vote_average') this.voteAverage = 0.0,
      @JsonKey(name: 'first_air_date') this.firstAirDate,
      @JsonKey(name: 'genre_ids') final List<int> genreIds = const [],
      this.popularity = 0.0,
      @JsonKey(name: 'original_language') this.originalLanguage = 'en'})
      : _genreIds = genreIds;
  factory _TvShowModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey()
  final String overview;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;
  final List<int> _genreIds;
  @override
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds {
    if (_genreIds is EqualUnmodifiableListView) return _genreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genreIds);
  }

  @override
  @JsonKey()
  final double popularity;
  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;

  /// Create a copy of TvShowModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TvShowModelCopyWith<_TvShowModel> get copyWith =>
      __$TvShowModelCopyWithImpl<_TvShowModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TvShowModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TvShowModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.firstAirDate, firstAirDate) ||
                other.firstAirDate == firstAirDate) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      overview,
      posterPath,
      backdropPath,
      voteAverage,
      firstAirDate,
      const DeepCollectionEquality().hash(_genreIds),
      popularity,
      originalLanguage);

  @override
  String toString() {
    return 'TvShowModel(id: $id, name: $name, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, firstAirDate: $firstAirDate, genreIds: $genreIds, popularity: $popularity, originalLanguage: $originalLanguage)';
  }
}

/// @nodoc
abstract mixin class _$TvShowModelCopyWith<$Res>
    implements $TvShowModelCopyWith<$Res> {
  factory _$TvShowModelCopyWith(
          _TvShowModel value, $Res Function(_TvShowModel) _then) =
      __$TvShowModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name') String name,
      String overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'first_air_date') String? firstAirDate,
      @JsonKey(name: 'genre_ids') List<int> genreIds,
      double popularity,
      @JsonKey(name: 'original_language') String originalLanguage});
}

/// @nodoc
class __$TvShowModelCopyWithImpl<$Res> implements _$TvShowModelCopyWith<$Res> {
  __$TvShowModelCopyWithImpl(this._self, this._then);

  final _TvShowModel _self;
  final $Res Function(_TvShowModel) _then;

  /// Create a copy of TvShowModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? voteAverage = null,
    Object? firstAirDate = freezed,
    Object? genreIds = null,
    Object? popularity = null,
    Object? originalLanguage = null,
  }) {
    return _then(_TvShowModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _self.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _self.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _self.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: null == voteAverage
          ? _self.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      firstAirDate: freezed == firstAirDate
          ? _self.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: null == genreIds
          ? _self._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      popularity: null == popularity
          ? _self.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      originalLanguage: null == originalLanguage
          ? _self.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$TvShowDetailModel {
  int get id;
  String get name;
  String get overview;
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @JsonKey(name: 'first_air_date')
  String? get firstAirDate;
  @JsonKey(name: 'number_of_seasons')
  int get numberOfSeasons;
  @JsonKey(name: 'number_of_episodes')
  int get numberOfEpisodes;
  List<TvGenreModel> get genres;
  String? get status;
  String? get tagline;
  @JsonKey(name: 'episode_run_time')
  List<int> get episodeRunTime;

  /// Create a copy of TvShowDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TvShowDetailModelCopyWith<TvShowDetailModel> get copyWith =>
      _$TvShowDetailModelCopyWithImpl<TvShowDetailModel>(
          this as TvShowDetailModel, _$identity);

  /// Serializes this TvShowDetailModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TvShowDetailModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.firstAirDate, firstAirDate) ||
                other.firstAirDate == firstAirDate) &&
            (identical(other.numberOfSeasons, numberOfSeasons) ||
                other.numberOfSeasons == numberOfSeasons) &&
            (identical(other.numberOfEpisodes, numberOfEpisodes) ||
                other.numberOfEpisodes == numberOfEpisodes) &&
            const DeepCollectionEquality().equals(other.genres, genres) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            const DeepCollectionEquality()
                .equals(other.episodeRunTime, episodeRunTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      overview,
      posterPath,
      backdropPath,
      voteAverage,
      firstAirDate,
      numberOfSeasons,
      numberOfEpisodes,
      const DeepCollectionEquality().hash(genres),
      status,
      tagline,
      const DeepCollectionEquality().hash(episodeRunTime));

  @override
  String toString() {
    return 'TvShowDetailModel(id: $id, name: $name, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, firstAirDate: $firstAirDate, numberOfSeasons: $numberOfSeasons, numberOfEpisodes: $numberOfEpisodes, genres: $genres, status: $status, tagline: $tagline, episodeRunTime: $episodeRunTime)';
  }
}

/// @nodoc
abstract mixin class $TvShowDetailModelCopyWith<$Res> {
  factory $TvShowDetailModelCopyWith(
          TvShowDetailModel value, $Res Function(TvShowDetailModel) _then) =
      _$TvShowDetailModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'first_air_date') String? firstAirDate,
      @JsonKey(name: 'number_of_seasons') int numberOfSeasons,
      @JsonKey(name: 'number_of_episodes') int numberOfEpisodes,
      List<TvGenreModel> genres,
      String? status,
      String? tagline,
      @JsonKey(name: 'episode_run_time') List<int> episodeRunTime});
}

/// @nodoc
class _$TvShowDetailModelCopyWithImpl<$Res>
    implements $TvShowDetailModelCopyWith<$Res> {
  _$TvShowDetailModelCopyWithImpl(this._self, this._then);

  final TvShowDetailModel _self;
  final $Res Function(TvShowDetailModel) _then;

  /// Create a copy of TvShowDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? voteAverage = null,
    Object? firstAirDate = freezed,
    Object? numberOfSeasons = null,
    Object? numberOfEpisodes = null,
    Object? genres = null,
    Object? status = freezed,
    Object? tagline = freezed,
    Object? episodeRunTime = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _self.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _self.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _self.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: null == voteAverage
          ? _self.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      firstAirDate: freezed == firstAirDate
          ? _self.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfSeasons: null == numberOfSeasons
          ? _self.numberOfSeasons
          : numberOfSeasons // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfEpisodes: null == numberOfEpisodes
          ? _self.numberOfEpisodes
          : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
              as int,
      genres: null == genres
          ? _self.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<TvGenreModel>,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _self.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeRunTime: null == episodeRunTime
          ? _self.episodeRunTime
          : episodeRunTime // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// Adds pattern-matching-related methods to [TvShowDetailModel].
extension TvShowDetailModelPatterns on TvShowDetailModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TvShowDetailModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvShowDetailModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TvShowDetailModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvShowDetailModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TvShowDetailModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvShowDetailModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            String name,
            String overview,
            @JsonKey(name: 'poster_path') String? posterPath,
            @JsonKey(name: 'backdrop_path') String? backdropPath,
            @JsonKey(name: 'vote_average') double voteAverage,
            @JsonKey(name: 'first_air_date') String? firstAirDate,
            @JsonKey(name: 'number_of_seasons') int numberOfSeasons,
            @JsonKey(name: 'number_of_episodes') int numberOfEpisodes,
            List<TvGenreModel> genres,
            String? status,
            String? tagline,
            @JsonKey(name: 'episode_run_time') List<int> episodeRunTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvShowDetailModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.overview,
            _that.posterPath,
            _that.backdropPath,
            _that.voteAverage,
            _that.firstAirDate,
            _that.numberOfSeasons,
            _that.numberOfEpisodes,
            _that.genres,
            _that.status,
            _that.tagline,
            _that.episodeRunTime);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            String name,
            String overview,
            @JsonKey(name: 'poster_path') String? posterPath,
            @JsonKey(name: 'backdrop_path') String? backdropPath,
            @JsonKey(name: 'vote_average') double voteAverage,
            @JsonKey(name: 'first_air_date') String? firstAirDate,
            @JsonKey(name: 'number_of_seasons') int numberOfSeasons,
            @JsonKey(name: 'number_of_episodes') int numberOfEpisodes,
            List<TvGenreModel> genres,
            String? status,
            String? tagline,
            @JsonKey(name: 'episode_run_time') List<int> episodeRunTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvShowDetailModel():
        return $default(
            _that.id,
            _that.name,
            _that.overview,
            _that.posterPath,
            _that.backdropPath,
            _that.voteAverage,
            _that.firstAirDate,
            _that.numberOfSeasons,
            _that.numberOfEpisodes,
            _that.genres,
            _that.status,
            _that.tagline,
            _that.episodeRunTime);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            String name,
            String overview,
            @JsonKey(name: 'poster_path') String? posterPath,
            @JsonKey(name: 'backdrop_path') String? backdropPath,
            @JsonKey(name: 'vote_average') double voteAverage,
            @JsonKey(name: 'first_air_date') String? firstAirDate,
            @JsonKey(name: 'number_of_seasons') int numberOfSeasons,
            @JsonKey(name: 'number_of_episodes') int numberOfEpisodes,
            List<TvGenreModel> genres,
            String? status,
            String? tagline,
            @JsonKey(name: 'episode_run_time') List<int> episodeRunTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvShowDetailModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.overview,
            _that.posterPath,
            _that.backdropPath,
            _that.voteAverage,
            _that.firstAirDate,
            _that.numberOfSeasons,
            _that.numberOfEpisodes,
            _that.genres,
            _that.status,
            _that.tagline,
            _that.episodeRunTime);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TvShowDetailModel implements TvShowDetailModel {
  const _TvShowDetailModel(
      {required this.id,
      required this.name,
      this.overview = '',
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'vote_average') this.voteAverage = 0.0,
      @JsonKey(name: 'first_air_date') this.firstAirDate,
      @JsonKey(name: 'number_of_seasons') this.numberOfSeasons = 0,
      @JsonKey(name: 'number_of_episodes') this.numberOfEpisodes = 0,
      final List<TvGenreModel> genres = const [],
      this.status,
      this.tagline,
      @JsonKey(name: 'episode_run_time')
      final List<int> episodeRunTime = const []})
      : _genres = genres,
        _episodeRunTime = episodeRunTime;
  factory _TvShowDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowDetailModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final String overview;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;
  @override
  @JsonKey(name: 'number_of_seasons')
  final int numberOfSeasons;
  @override
  @JsonKey(name: 'number_of_episodes')
  final int numberOfEpisodes;
  final List<TvGenreModel> _genres;
  @override
  @JsonKey()
  List<TvGenreModel> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  final String? status;
  @override
  final String? tagline;
  final List<int> _episodeRunTime;
  @override
  @JsonKey(name: 'episode_run_time')
  List<int> get episodeRunTime {
    if (_episodeRunTime is EqualUnmodifiableListView) return _episodeRunTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodeRunTime);
  }

  /// Create a copy of TvShowDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TvShowDetailModelCopyWith<_TvShowDetailModel> get copyWith =>
      __$TvShowDetailModelCopyWithImpl<_TvShowDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TvShowDetailModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TvShowDetailModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.firstAirDate, firstAirDate) ||
                other.firstAirDate == firstAirDate) &&
            (identical(other.numberOfSeasons, numberOfSeasons) ||
                other.numberOfSeasons == numberOfSeasons) &&
            (identical(other.numberOfEpisodes, numberOfEpisodes) ||
                other.numberOfEpisodes == numberOfEpisodes) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            const DeepCollectionEquality()
                .equals(other._episodeRunTime, _episodeRunTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      overview,
      posterPath,
      backdropPath,
      voteAverage,
      firstAirDate,
      numberOfSeasons,
      numberOfEpisodes,
      const DeepCollectionEquality().hash(_genres),
      status,
      tagline,
      const DeepCollectionEquality().hash(_episodeRunTime));

  @override
  String toString() {
    return 'TvShowDetailModel(id: $id, name: $name, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, firstAirDate: $firstAirDate, numberOfSeasons: $numberOfSeasons, numberOfEpisodes: $numberOfEpisodes, genres: $genres, status: $status, tagline: $tagline, episodeRunTime: $episodeRunTime)';
  }
}

/// @nodoc
abstract mixin class _$TvShowDetailModelCopyWith<$Res>
    implements $TvShowDetailModelCopyWith<$Res> {
  factory _$TvShowDetailModelCopyWith(
          _TvShowDetailModel value, $Res Function(_TvShowDetailModel) _then) =
      __$TvShowDetailModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'first_air_date') String? firstAirDate,
      @JsonKey(name: 'number_of_seasons') int numberOfSeasons,
      @JsonKey(name: 'number_of_episodes') int numberOfEpisodes,
      List<TvGenreModel> genres,
      String? status,
      String? tagline,
      @JsonKey(name: 'episode_run_time') List<int> episodeRunTime});
}

/// @nodoc
class __$TvShowDetailModelCopyWithImpl<$Res>
    implements _$TvShowDetailModelCopyWith<$Res> {
  __$TvShowDetailModelCopyWithImpl(this._self, this._then);

  final _TvShowDetailModel _self;
  final $Res Function(_TvShowDetailModel) _then;

  /// Create a copy of TvShowDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? voteAverage = null,
    Object? firstAirDate = freezed,
    Object? numberOfSeasons = null,
    Object? numberOfEpisodes = null,
    Object? genres = null,
    Object? status = freezed,
    Object? tagline = freezed,
    Object? episodeRunTime = null,
  }) {
    return _then(_TvShowDetailModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _self.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _self.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _self.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: null == voteAverage
          ? _self.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      firstAirDate: freezed == firstAirDate
          ? _self.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfSeasons: null == numberOfSeasons
          ? _self.numberOfSeasons
          : numberOfSeasons // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfEpisodes: null == numberOfEpisodes
          ? _self.numberOfEpisodes
          : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
              as int,
      genres: null == genres
          ? _self._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<TvGenreModel>,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _self.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeRunTime: null == episodeRunTime
          ? _self._episodeRunTime
          : episodeRunTime // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
mixin _$TvGenreModel {
  int get id;
  String get name;

  /// Create a copy of TvGenreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TvGenreModelCopyWith<TvGenreModel> get copyWith =>
      _$TvGenreModelCopyWithImpl<TvGenreModel>(
          this as TvGenreModel, _$identity);

  /// Serializes this TvGenreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TvGenreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'TvGenreModel(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $TvGenreModelCopyWith<$Res> {
  factory $TvGenreModelCopyWith(
          TvGenreModel value, $Res Function(TvGenreModel) _then) =
      _$TvGenreModelCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$TvGenreModelCopyWithImpl<$Res> implements $TvGenreModelCopyWith<$Res> {
  _$TvGenreModelCopyWithImpl(this._self, this._then);

  final TvGenreModel _self;
  final $Res Function(TvGenreModel) _then;

  /// Create a copy of TvGenreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [TvGenreModel].
extension TvGenreModelPatterns on TvGenreModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TvGenreModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvGenreModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TvGenreModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvGenreModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TvGenreModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvGenreModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TvGenreModel() when $default != null:
        return $default(_that.id, _that.name);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvGenreModel():
        return $default(_that.id, _that.name);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TvGenreModel() when $default != null:
        return $default(_that.id, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TvGenreModel implements TvGenreModel {
  const _TvGenreModel({required this.id, required this.name});
  factory _TvGenreModel.fromJson(Map<String, dynamic> json) =>
      _$TvGenreModelFromJson(json);

  @override
  final int id;
  @override
  final String name;

  /// Create a copy of TvGenreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TvGenreModelCopyWith<_TvGenreModel> get copyWith =>
      __$TvGenreModelCopyWithImpl<_TvGenreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TvGenreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TvGenreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'TvGenreModel(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$TvGenreModelCopyWith<$Res>
    implements $TvGenreModelCopyWith<$Res> {
  factory _$TvGenreModelCopyWith(
          _TvGenreModel value, $Res Function(_TvGenreModel) _then) =
      __$TvGenreModelCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$TvGenreModelCopyWithImpl<$Res>
    implements _$TvGenreModelCopyWith<$Res> {
  __$TvGenreModelCopyWithImpl(this._self, this._then);

  final _TvGenreModel _self;
  final $Res Function(_TvGenreModel) _then;

  /// Create a copy of TvGenreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_TvGenreModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
