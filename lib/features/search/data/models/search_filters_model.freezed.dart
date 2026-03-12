// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_filters_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchFilters {
  String get query;
  String get mediaType; // multi | movie | tv
  int? get genreId;
  String? get genreName;
  int? get releaseYear;
  double get minRating;
  double get maxRating;
  String get sortBy;
  int get page;

  /// Create a copy of SearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchFiltersCopyWith<SearchFilters> get copyWith =>
      _$SearchFiltersCopyWithImpl<SearchFilters>(
          this as SearchFilters, _$identity);

  /// Serializes this SearchFilters to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchFilters &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.genreId, genreId) || other.genreId == genreId) &&
            (identical(other.genreName, genreName) ||
                other.genreName == genreName) &&
            (identical(other.releaseYear, releaseYear) ||
                other.releaseYear == releaseYear) &&
            (identical(other.minRating, minRating) ||
                other.minRating == minRating) &&
            (identical(other.maxRating, maxRating) ||
                other.maxRating == maxRating) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, query, mediaType, genreId,
      genreName, releaseYear, minRating, maxRating, sortBy, page);

  @override
  String toString() {
    return 'SearchFilters(query: $query, mediaType: $mediaType, genreId: $genreId, genreName: $genreName, releaseYear: $releaseYear, minRating: $minRating, maxRating: $maxRating, sortBy: $sortBy, page: $page)';
  }
}

/// @nodoc
abstract mixin class $SearchFiltersCopyWith<$Res> {
  factory $SearchFiltersCopyWith(
          SearchFilters value, $Res Function(SearchFilters) _then) =
      _$SearchFiltersCopyWithImpl;
  @useResult
  $Res call(
      {String query,
      String mediaType,
      int? genreId,
      String? genreName,
      int? releaseYear,
      double minRating,
      double maxRating,
      String sortBy,
      int page});
}

/// @nodoc
class _$SearchFiltersCopyWithImpl<$Res>
    implements $SearchFiltersCopyWith<$Res> {
  _$SearchFiltersCopyWithImpl(this._self, this._then);

  final SearchFilters _self;
  final $Res Function(SearchFilters) _then;

  /// Create a copy of SearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? mediaType = null,
    Object? genreId = freezed,
    Object? genreName = freezed,
    Object? releaseYear = freezed,
    Object? minRating = null,
    Object? maxRating = null,
    Object? sortBy = null,
    Object? page = null,
  }) {
    return _then(_self.copyWith(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _self.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      genreId: freezed == genreId
          ? _self.genreId
          : genreId // ignore: cast_nullable_to_non_nullable
              as int?,
      genreName: freezed == genreName
          ? _self.genreName
          : genreName // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseYear: freezed == releaseYear
          ? _self.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int?,
      minRating: null == minRating
          ? _self.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as double,
      maxRating: null == maxRating
          ? _self.maxRating
          : maxRating // ignore: cast_nullable_to_non_nullable
              as double,
      sortBy: null == sortBy
          ? _self.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [SearchFilters].
extension SearchFiltersPatterns on SearchFilters {
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
    TResult Function(_SearchFilters value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchFilters() when $default != null:
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
    TResult Function(_SearchFilters value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchFilters():
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
    TResult? Function(_SearchFilters value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchFilters() when $default != null:
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
            String query,
            String mediaType,
            int? genreId,
            String? genreName,
            int? releaseYear,
            double minRating,
            double maxRating,
            String sortBy,
            int page)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchFilters() when $default != null:
        return $default(
            _that.query,
            _that.mediaType,
            _that.genreId,
            _that.genreName,
            _that.releaseYear,
            _that.minRating,
            _that.maxRating,
            _that.sortBy,
            _that.page);
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
            String query,
            String mediaType,
            int? genreId,
            String? genreName,
            int? releaseYear,
            double minRating,
            double maxRating,
            String sortBy,
            int page)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchFilters():
        return $default(
            _that.query,
            _that.mediaType,
            _that.genreId,
            _that.genreName,
            _that.releaseYear,
            _that.minRating,
            _that.maxRating,
            _that.sortBy,
            _that.page);
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
            String query,
            String mediaType,
            int? genreId,
            String? genreName,
            int? releaseYear,
            double minRating,
            double maxRating,
            String sortBy,
            int page)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchFilters() when $default != null:
        return $default(
            _that.query,
            _that.mediaType,
            _that.genreId,
            _that.genreName,
            _that.releaseYear,
            _that.minRating,
            _that.maxRating,
            _that.sortBy,
            _that.page);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchFilters implements SearchFilters {
  const _SearchFilters(
      {this.query = '',
      this.mediaType = 'multi',
      this.genreId,
      this.genreName,
      this.releaseYear,
      this.minRating = 0.0,
      this.maxRating = 10.0,
      this.sortBy = 'popularity.desc',
      this.page = 1});
  factory _SearchFilters.fromJson(Map<String, dynamic> json) =>
      _$SearchFiltersFromJson(json);

  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final String mediaType;
// multi | movie | tv
  @override
  final int? genreId;
  @override
  final String? genreName;
  @override
  final int? releaseYear;
  @override
  @JsonKey()
  final double minRating;
  @override
  @JsonKey()
  final double maxRating;
  @override
  @JsonKey()
  final String sortBy;
  @override
  @JsonKey()
  final int page;

  /// Create a copy of SearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchFiltersCopyWith<_SearchFilters> get copyWith =>
      __$SearchFiltersCopyWithImpl<_SearchFilters>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchFiltersToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchFilters &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.genreId, genreId) || other.genreId == genreId) &&
            (identical(other.genreName, genreName) ||
                other.genreName == genreName) &&
            (identical(other.releaseYear, releaseYear) ||
                other.releaseYear == releaseYear) &&
            (identical(other.minRating, minRating) ||
                other.minRating == minRating) &&
            (identical(other.maxRating, maxRating) ||
                other.maxRating == maxRating) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, query, mediaType, genreId,
      genreName, releaseYear, minRating, maxRating, sortBy, page);

  @override
  String toString() {
    return 'SearchFilters(query: $query, mediaType: $mediaType, genreId: $genreId, genreName: $genreName, releaseYear: $releaseYear, minRating: $minRating, maxRating: $maxRating, sortBy: $sortBy, page: $page)';
  }
}

/// @nodoc
abstract mixin class _$SearchFiltersCopyWith<$Res>
    implements $SearchFiltersCopyWith<$Res> {
  factory _$SearchFiltersCopyWith(
          _SearchFilters value, $Res Function(_SearchFilters) _then) =
      __$SearchFiltersCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String query,
      String mediaType,
      int? genreId,
      String? genreName,
      int? releaseYear,
      double minRating,
      double maxRating,
      String sortBy,
      int page});
}

/// @nodoc
class __$SearchFiltersCopyWithImpl<$Res>
    implements _$SearchFiltersCopyWith<$Res> {
  __$SearchFiltersCopyWithImpl(this._self, this._then);

  final _SearchFilters _self;
  final $Res Function(_SearchFilters) _then;

  /// Create a copy of SearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? mediaType = null,
    Object? genreId = freezed,
    Object? genreName = freezed,
    Object? releaseYear = freezed,
    Object? minRating = null,
    Object? maxRating = null,
    Object? sortBy = null,
    Object? page = null,
  }) {
    return _then(_SearchFilters(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _self.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      genreId: freezed == genreId
          ? _self.genreId
          : genreId // ignore: cast_nullable_to_non_nullable
              as int?,
      genreName: freezed == genreName
          ? _self.genreName
          : genreName // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseYear: freezed == releaseYear
          ? _self.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int?,
      minRating: null == minRating
          ? _self.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as double,
      maxRating: null == maxRating
          ? _self.maxRating
          : maxRating // ignore: cast_nullable_to_non_nullable
              as double,
      sortBy: null == sortBy
          ? _self.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
