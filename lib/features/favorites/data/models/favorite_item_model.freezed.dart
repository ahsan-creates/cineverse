// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteItem {
  String get id;
  int get mediaId;
  MediaType get mediaType;
  String get title;
  String? get posterPath;
  double get rating;
  @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson)
  DateTime get addedAt;

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteItemCopyWith<FavoriteItem> get copyWith =>
      _$FavoriteItemCopyWithImpl<FavoriteItem>(
          this as FavoriteItem, _$identity);

  /// Serializes this FavoriteItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, mediaId, mediaType, title, posterPath, rating, addedAt);

  @override
  String toString() {
    return 'FavoriteItem(id: $id, mediaId: $mediaId, mediaType: $mediaType, title: $title, posterPath: $posterPath, rating: $rating, addedAt: $addedAt)';
  }
}

/// @nodoc
abstract mixin class $FavoriteItemCopyWith<$Res> {
  factory $FavoriteItemCopyWith(
          FavoriteItem value, $Res Function(FavoriteItem) _then) =
      _$FavoriteItemCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      int mediaId,
      MediaType mediaType,
      String title,
      String? posterPath,
      double rating,
      @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson) DateTime addedAt});
}

/// @nodoc
class _$FavoriteItemCopyWithImpl<$Res> implements $FavoriteItemCopyWith<$Res> {
  _$FavoriteItemCopyWithImpl(this._self, this._then);

  final FavoriteItem _self;
  final $Res Function(FavoriteItem) _then;

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mediaId = null,
    Object? mediaType = null,
    Object? title = null,
    Object? posterPath = freezed,
    Object? rating = null,
    Object? addedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mediaId: null == mediaId
          ? _self.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int,
      mediaType: null == mediaType
          ? _self.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _self.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      addedAt: null == addedAt
          ? _self.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [FavoriteItem].
extension FavoriteItemPatterns on FavoriteItem {
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
    TResult Function(_FavoriteItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FavoriteItem() when $default != null:
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
    TResult Function(_FavoriteItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteItem():
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
    TResult? Function(_FavoriteItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteItem() when $default != null:
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
            String id,
            int mediaId,
            MediaType mediaType,
            String title,
            String? posterPath,
            double rating,
            @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson)
            DateTime addedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FavoriteItem() when $default != null:
        return $default(_that.id, _that.mediaId, _that.mediaType, _that.title,
            _that.posterPath, _that.rating, _that.addedAt);
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
            String id,
            int mediaId,
            MediaType mediaType,
            String title,
            String? posterPath,
            double rating,
            @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson) DateTime addedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteItem():
        return $default(_that.id, _that.mediaId, _that.mediaType, _that.title,
            _that.posterPath, _that.rating, _that.addedAt);
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
            String id,
            int mediaId,
            MediaType mediaType,
            String title,
            String? posterPath,
            double rating,
            @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson)
            DateTime addedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteItem() when $default != null:
        return $default(_that.id, _that.mediaId, _that.mediaType, _that.title,
            _that.posterPath, _that.rating, _that.addedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FavoriteItem implements FavoriteItem {
  const _FavoriteItem(
      {required this.id,
      required this.mediaId,
      required this.mediaType,
      required this.title,
      this.posterPath,
      this.rating = 0.0,
      @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson)
      required this.addedAt});
  factory _FavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$FavoriteItemFromJson(json);

  @override
  final String id;
  @override
  final int mediaId;
  @override
  final MediaType mediaType;
  @override
  final String title;
  @override
  final String? posterPath;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson)
  final DateTime addedAt;

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FavoriteItemCopyWith<_FavoriteItem> get copyWith =>
      __$FavoriteItemCopyWithImpl<_FavoriteItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FavoriteItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoriteItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, mediaId, mediaType, title, posterPath, rating, addedAt);

  @override
  String toString() {
    return 'FavoriteItem(id: $id, mediaId: $mediaId, mediaType: $mediaType, title: $title, posterPath: $posterPath, rating: $rating, addedAt: $addedAt)';
  }
}

/// @nodoc
abstract mixin class _$FavoriteItemCopyWith<$Res>
    implements $FavoriteItemCopyWith<$Res> {
  factory _$FavoriteItemCopyWith(
          _FavoriteItem value, $Res Function(_FavoriteItem) _then) =
      __$FavoriteItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      int mediaId,
      MediaType mediaType,
      String title,
      String? posterPath,
      double rating,
      @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson) DateTime addedAt});
}

/// @nodoc
class __$FavoriteItemCopyWithImpl<$Res>
    implements _$FavoriteItemCopyWith<$Res> {
  __$FavoriteItemCopyWithImpl(this._self, this._then);

  final _FavoriteItem _self;
  final $Res Function(_FavoriteItem) _then;

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? mediaId = null,
    Object? mediaType = null,
    Object? title = null,
    Object? posterPath = freezed,
    Object? rating = null,
    Object? addedAt = null,
  }) {
    return _then(_FavoriteItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mediaId: null == mediaId
          ? _self.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int,
      mediaType: null == mediaType
          ? _self.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _self.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      addedAt: null == addedAt
          ? _self.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
