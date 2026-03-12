// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchProviderItem {
  @JsonKey(name: 'provider_id')
  int get providerId;
  @JsonKey(name: 'provider_name')
  String get providerName;
  @JsonKey(name: 'logo_path')
  String get logoPath;
  int get displayPriority;

  /// Create a copy of WatchProviderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchProviderItemCopyWith<WatchProviderItem> get copyWith =>
      _$WatchProviderItemCopyWithImpl<WatchProviderItem>(
          this as WatchProviderItem, _$identity);

  /// Serializes this WatchProviderItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchProviderItem &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.providerName, providerName) ||
                other.providerName == providerName) &&
            (identical(other.logoPath, logoPath) ||
                other.logoPath == logoPath) &&
            (identical(other.displayPriority, displayPriority) ||
                other.displayPriority == displayPriority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, providerId, providerName, logoPath, displayPriority);

  @override
  String toString() {
    return 'WatchProviderItem(providerId: $providerId, providerName: $providerName, logoPath: $logoPath, displayPriority: $displayPriority)';
  }
}

/// @nodoc
abstract mixin class $WatchProviderItemCopyWith<$Res> {
  factory $WatchProviderItemCopyWith(
          WatchProviderItem value, $Res Function(WatchProviderItem) _then) =
      _$WatchProviderItemCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'provider_id') int providerId,
      @JsonKey(name: 'provider_name') String providerName,
      @JsonKey(name: 'logo_path') String logoPath,
      int displayPriority});
}

/// @nodoc
class _$WatchProviderItemCopyWithImpl<$Res>
    implements $WatchProviderItemCopyWith<$Res> {
  _$WatchProviderItemCopyWithImpl(this._self, this._then);

  final WatchProviderItem _self;
  final $Res Function(WatchProviderItem) _then;

  /// Create a copy of WatchProviderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = null,
    Object? providerName = null,
    Object? logoPath = null,
    Object? displayPriority = null,
  }) {
    return _then(_self.copyWith(
      providerId: null == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as int,
      providerName: null == providerName
          ? _self.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as String,
      logoPath: null == logoPath
          ? _self.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String,
      displayPriority: null == displayPriority
          ? _self.displayPriority
          : displayPriority // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [WatchProviderItem].
extension WatchProviderItemPatterns on WatchProviderItem {
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
    TResult Function(_WatchProviderItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchProviderItem() when $default != null:
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
    TResult Function(_WatchProviderItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchProviderItem():
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
    TResult? Function(_WatchProviderItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchProviderItem() when $default != null:
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
            @JsonKey(name: 'provider_id') int providerId,
            @JsonKey(name: 'provider_name') String providerName,
            @JsonKey(name: 'logo_path') String logoPath,
            int displayPriority)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchProviderItem() when $default != null:
        return $default(_that.providerId, _that.providerName, _that.logoPath,
            _that.displayPriority);
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
            @JsonKey(name: 'provider_id') int providerId,
            @JsonKey(name: 'provider_name') String providerName,
            @JsonKey(name: 'logo_path') String logoPath,
            int displayPriority)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchProviderItem():
        return $default(_that.providerId, _that.providerName, _that.logoPath,
            _that.displayPriority);
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
            @JsonKey(name: 'provider_id') int providerId,
            @JsonKey(name: 'provider_name') String providerName,
            @JsonKey(name: 'logo_path') String logoPath,
            int displayPriority)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchProviderItem() when $default != null:
        return $default(_that.providerId, _that.providerName, _that.logoPath,
            _that.displayPriority);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WatchProviderItem implements WatchProviderItem {
  const _WatchProviderItem(
      {@JsonKey(name: 'provider_id') required this.providerId,
      @JsonKey(name: 'provider_name') required this.providerName,
      @JsonKey(name: 'logo_path') required this.logoPath,
      this.displayPriority = 0});
  factory _WatchProviderItem.fromJson(Map<String, dynamic> json) =>
      _$WatchProviderItemFromJson(json);

  @override
  @JsonKey(name: 'provider_id')
  final int providerId;
  @override
  @JsonKey(name: 'provider_name')
  final String providerName;
  @override
  @JsonKey(name: 'logo_path')
  final String logoPath;
  @override
  @JsonKey()
  final int displayPriority;

  /// Create a copy of WatchProviderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchProviderItemCopyWith<_WatchProviderItem> get copyWith =>
      __$WatchProviderItemCopyWithImpl<_WatchProviderItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WatchProviderItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchProviderItem &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.providerName, providerName) ||
                other.providerName == providerName) &&
            (identical(other.logoPath, logoPath) ||
                other.logoPath == logoPath) &&
            (identical(other.displayPriority, displayPriority) ||
                other.displayPriority == displayPriority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, providerId, providerName, logoPath, displayPriority);

  @override
  String toString() {
    return 'WatchProviderItem(providerId: $providerId, providerName: $providerName, logoPath: $logoPath, displayPriority: $displayPriority)';
  }
}

/// @nodoc
abstract mixin class _$WatchProviderItemCopyWith<$Res>
    implements $WatchProviderItemCopyWith<$Res> {
  factory _$WatchProviderItemCopyWith(
          _WatchProviderItem value, $Res Function(_WatchProviderItem) _then) =
      __$WatchProviderItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'provider_id') int providerId,
      @JsonKey(name: 'provider_name') String providerName,
      @JsonKey(name: 'logo_path') String logoPath,
      int displayPriority});
}

/// @nodoc
class __$WatchProviderItemCopyWithImpl<$Res>
    implements _$WatchProviderItemCopyWith<$Res> {
  __$WatchProviderItemCopyWithImpl(this._self, this._then);

  final _WatchProviderItem _self;
  final $Res Function(_WatchProviderItem) _then;

  /// Create a copy of WatchProviderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? providerId = null,
    Object? providerName = null,
    Object? logoPath = null,
    Object? displayPriority = null,
  }) {
    return _then(_WatchProviderItem(
      providerId: null == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as int,
      providerName: null == providerName
          ? _self.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as String,
      logoPath: null == logoPath
          ? _self.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String,
      displayPriority: null == displayPriority
          ? _self.displayPriority
          : displayPriority // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$WatchProviders {
  List<WatchProviderItem> get flatrate; // Streaming
  List<WatchProviderItem> get buy; // Buy
  List<WatchProviderItem> get rent; // Rent
  List<WatchProviderItem> get free; // Free
  String? get link;

  /// Create a copy of WatchProviders
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchProvidersCopyWith<WatchProviders> get copyWith =>
      _$WatchProvidersCopyWithImpl<WatchProviders>(
          this as WatchProviders, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchProviders &&
            const DeepCollectionEquality().equals(other.flatrate, flatrate) &&
            const DeepCollectionEquality().equals(other.buy, buy) &&
            const DeepCollectionEquality().equals(other.rent, rent) &&
            const DeepCollectionEquality().equals(other.free, free) &&
            (identical(other.link, link) || other.link == link));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(flatrate),
      const DeepCollectionEquality().hash(buy),
      const DeepCollectionEquality().hash(rent),
      const DeepCollectionEquality().hash(free),
      link);

  @override
  String toString() {
    return 'WatchProviders(flatrate: $flatrate, buy: $buy, rent: $rent, free: $free, link: $link)';
  }
}

/// @nodoc
abstract mixin class $WatchProvidersCopyWith<$Res> {
  factory $WatchProvidersCopyWith(
          WatchProviders value, $Res Function(WatchProviders) _then) =
      _$WatchProvidersCopyWithImpl;
  @useResult
  $Res call(
      {List<WatchProviderItem> flatrate,
      List<WatchProviderItem> buy,
      List<WatchProviderItem> rent,
      List<WatchProviderItem> free,
      String? link});
}

/// @nodoc
class _$WatchProvidersCopyWithImpl<$Res>
    implements $WatchProvidersCopyWith<$Res> {
  _$WatchProvidersCopyWithImpl(this._self, this._then);

  final WatchProviders _self;
  final $Res Function(WatchProviders) _then;

  /// Create a copy of WatchProviders
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flatrate = null,
    Object? buy = null,
    Object? rent = null,
    Object? free = null,
    Object? link = freezed,
  }) {
    return _then(_self.copyWith(
      flatrate: null == flatrate
          ? _self.flatrate
          : flatrate // ignore: cast_nullable_to_non_nullable
              as List<WatchProviderItem>,
      buy: null == buy
          ? _self.buy
          : buy // ignore: cast_nullable_to_non_nullable
              as List<WatchProviderItem>,
      rent: null == rent
          ? _self.rent
          : rent // ignore: cast_nullable_to_non_nullable
              as List<WatchProviderItem>,
      free: null == free
          ? _self.free
          : free // ignore: cast_nullable_to_non_nullable
              as List<WatchProviderItem>,
      link: freezed == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [WatchProviders].
extension WatchProvidersPatterns on WatchProviders {
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
    TResult Function(_WatchProviders value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchProviders() when $default != null:
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
    TResult Function(_WatchProviders value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchProviders():
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
    TResult? Function(_WatchProviders value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchProviders() when $default != null:
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
            List<WatchProviderItem> flatrate,
            List<WatchProviderItem> buy,
            List<WatchProviderItem> rent,
            List<WatchProviderItem> free,
            String? link)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WatchProviders() when $default != null:
        return $default(
            _that.flatrate, _that.buy, _that.rent, _that.free, _that.link);
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
            List<WatchProviderItem> flatrate,
            List<WatchProviderItem> buy,
            List<WatchProviderItem> rent,
            List<WatchProviderItem> free,
            String? link)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchProviders():
        return $default(
            _that.flatrate, _that.buy, _that.rent, _that.free, _that.link);
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
            List<WatchProviderItem> flatrate,
            List<WatchProviderItem> buy,
            List<WatchProviderItem> rent,
            List<WatchProviderItem> free,
            String? link)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WatchProviders() when $default != null:
        return $default(
            _that.flatrate, _that.buy, _that.rent, _that.free, _that.link);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WatchProviders implements WatchProviders {
  const _WatchProviders(
      {final List<WatchProviderItem> flatrate = const [],
      final List<WatchProviderItem> buy = const [],
      final List<WatchProviderItem> rent = const [],
      final List<WatchProviderItem> free = const [],
      this.link})
      : _flatrate = flatrate,
        _buy = buy,
        _rent = rent,
        _free = free;

  final List<WatchProviderItem> _flatrate;
  @override
  @JsonKey()
  List<WatchProviderItem> get flatrate {
    if (_flatrate is EqualUnmodifiableListView) return _flatrate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flatrate);
  }

// Streaming
  final List<WatchProviderItem> _buy;
// Streaming
  @override
  @JsonKey()
  List<WatchProviderItem> get buy {
    if (_buy is EqualUnmodifiableListView) return _buy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_buy);
  }

// Buy
  final List<WatchProviderItem> _rent;
// Buy
  @override
  @JsonKey()
  List<WatchProviderItem> get rent {
    if (_rent is EqualUnmodifiableListView) return _rent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rent);
  }

// Rent
  final List<WatchProviderItem> _free;
// Rent
  @override
  @JsonKey()
  List<WatchProviderItem> get free {
    if (_free is EqualUnmodifiableListView) return _free;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_free);
  }

// Free
  @override
  final String? link;

  /// Create a copy of WatchProviders
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchProvidersCopyWith<_WatchProviders> get copyWith =>
      __$WatchProvidersCopyWithImpl<_WatchProviders>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchProviders &&
            const DeepCollectionEquality().equals(other._flatrate, _flatrate) &&
            const DeepCollectionEquality().equals(other._buy, _buy) &&
            const DeepCollectionEquality().equals(other._rent, _rent) &&
            const DeepCollectionEquality().equals(other._free, _free) &&
            (identical(other.link, link) || other.link == link));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_flatrate),
      const DeepCollectionEquality().hash(_buy),
      const DeepCollectionEquality().hash(_rent),
      const DeepCollectionEquality().hash(_free),
      link);

  @override
  String toString() {
    return 'WatchProviders(flatrate: $flatrate, buy: $buy, rent: $rent, free: $free, link: $link)';
  }
}

/// @nodoc
abstract mixin class _$WatchProvidersCopyWith<$Res>
    implements $WatchProvidersCopyWith<$Res> {
  factory _$WatchProvidersCopyWith(
          _WatchProviders value, $Res Function(_WatchProviders) _then) =
      __$WatchProvidersCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<WatchProviderItem> flatrate,
      List<WatchProviderItem> buy,
      List<WatchProviderItem> rent,
      List<WatchProviderItem> free,
      String? link});
}

/// @nodoc
class __$WatchProvidersCopyWithImpl<$Res>
    implements _$WatchProvidersCopyWith<$Res> {
  __$WatchProvidersCopyWithImpl(this._self, this._then);

  final _WatchProviders _self;
  final $Res Function(_WatchProviders) _then;

  /// Create a copy of WatchProviders
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? flatrate = null,
    Object? buy = null,
    Object? rent = null,
    Object? free = null,
    Object? link = freezed,
  }) {
    return _then(_WatchProviders(
      flatrate: null == flatrate
          ? _self._flatrate
          : flatrate // ignore: cast_nullable_to_non_nullable
              as List<WatchProviderItem>,
      buy: null == buy
          ? _self._buy
          : buy // ignore: cast_nullable_to_non_nullable
              as List<WatchProviderItem>,
      rent: null == rent
          ? _self._rent
          : rent // ignore: cast_nullable_to_non_nullable
              as List<WatchProviderItem>,
      free: null == free
          ? _self._free
          : free // ignore: cast_nullable_to_non_nullable
              as List<WatchProviderItem>,
      link: freezed == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
