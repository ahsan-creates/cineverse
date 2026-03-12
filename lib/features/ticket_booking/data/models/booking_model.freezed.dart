// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Booking {
  String get id;
  int get movieId;
  String get movieTitle;
  String? get moviePosterPath;
  String get cinemaName;
  String get date; // yyyy-MM-dd
  String get timeSlot;
  List<String> get seats;
  BookingStatus get status;
  double get totalPrice;
  @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson)
  DateTime get bookedAt;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookingCopyWith<Booking> get copyWith =>
      _$BookingCopyWithImpl<Booking>(this as Booking, _$identity);

  /// Serializes this Booking to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Booking &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.movieId, movieId) || other.movieId == movieId) &&
            (identical(other.movieTitle, movieTitle) ||
                other.movieTitle == movieTitle) &&
            (identical(other.moviePosterPath, moviePosterPath) ||
                other.moviePosterPath == moviePosterPath) &&
            (identical(other.cinemaName, cinemaName) ||
                other.cinemaName == cinemaName) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            const DeepCollectionEquality().equals(other.seats, seats) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.bookedAt, bookedAt) ||
                other.bookedAt == bookedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      movieId,
      movieTitle,
      moviePosterPath,
      cinemaName,
      date,
      timeSlot,
      const DeepCollectionEquality().hash(seats),
      status,
      totalPrice,
      bookedAt);

  @override
  String toString() {
    return 'Booking(id: $id, movieId: $movieId, movieTitle: $movieTitle, moviePosterPath: $moviePosterPath, cinemaName: $cinemaName, date: $date, timeSlot: $timeSlot, seats: $seats, status: $status, totalPrice: $totalPrice, bookedAt: $bookedAt)';
  }
}

/// @nodoc
abstract mixin class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) _then) =
      _$BookingCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      int movieId,
      String movieTitle,
      String? moviePosterPath,
      String cinemaName,
      String date,
      String timeSlot,
      List<String> seats,
      BookingStatus status,
      double totalPrice,
      @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson) DateTime bookedAt});
}

/// @nodoc
class _$BookingCopyWithImpl<$Res> implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._self, this._then);

  final Booking _self;
  final $Res Function(Booking) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? movieId = null,
    Object? movieTitle = null,
    Object? moviePosterPath = freezed,
    Object? cinemaName = null,
    Object? date = null,
    Object? timeSlot = null,
    Object? seats = null,
    Object? status = null,
    Object? totalPrice = null,
    Object? bookedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      movieId: null == movieId
          ? _self.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
      movieTitle: null == movieTitle
          ? _self.movieTitle
          : movieTitle // ignore: cast_nullable_to_non_nullable
              as String,
      moviePosterPath: freezed == moviePosterPath
          ? _self.moviePosterPath
          : moviePosterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      cinemaName: null == cinemaName
          ? _self.cinemaName
          : cinemaName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      timeSlot: null == timeSlot
          ? _self.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _self.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingStatus,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      bookedAt: null == bookedAt
          ? _self.bookedAt
          : bookedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [Booking].
extension BookingPatterns on Booking {
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
    TResult Function(_Booking value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Booking() when $default != null:
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
    TResult Function(_Booking value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Booking():
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
    TResult? Function(_Booking value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Booking() when $default != null:
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
            int movieId,
            String movieTitle,
            String? moviePosterPath,
            String cinemaName,
            String date,
            String timeSlot,
            List<String> seats,
            BookingStatus status,
            double totalPrice,
            @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson)
            DateTime bookedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Booking() when $default != null:
        return $default(
            _that.id,
            _that.movieId,
            _that.movieTitle,
            _that.moviePosterPath,
            _that.cinemaName,
            _that.date,
            _that.timeSlot,
            _that.seats,
            _that.status,
            _that.totalPrice,
            _that.bookedAt);
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
            int movieId,
            String movieTitle,
            String? moviePosterPath,
            String cinemaName,
            String date,
            String timeSlot,
            List<String> seats,
            BookingStatus status,
            double totalPrice,
            @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson)
            DateTime bookedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Booking():
        return $default(
            _that.id,
            _that.movieId,
            _that.movieTitle,
            _that.moviePosterPath,
            _that.cinemaName,
            _that.date,
            _that.timeSlot,
            _that.seats,
            _that.status,
            _that.totalPrice,
            _that.bookedAt);
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
            int movieId,
            String movieTitle,
            String? moviePosterPath,
            String cinemaName,
            String date,
            String timeSlot,
            List<String> seats,
            BookingStatus status,
            double totalPrice,
            @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson)
            DateTime bookedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Booking() when $default != null:
        return $default(
            _that.id,
            _that.movieId,
            _that.movieTitle,
            _that.moviePosterPath,
            _that.cinemaName,
            _that.date,
            _that.timeSlot,
            _that.seats,
            _that.status,
            _that.totalPrice,
            _that.bookedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Booking implements Booking {
  const _Booking(
      {required this.id,
      required this.movieId,
      required this.movieTitle,
      this.moviePosterPath,
      required this.cinemaName,
      required this.date,
      required this.timeSlot,
      required final List<String> seats,
      this.status = BookingStatus.confirmed,
      this.totalPrice = 0.0,
      @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson)
      required this.bookedAt})
      : _seats = seats;
  factory _Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  @override
  final String id;
  @override
  final int movieId;
  @override
  final String movieTitle;
  @override
  final String? moviePosterPath;
  @override
  final String cinemaName;
  @override
  final String date;
// yyyy-MM-dd
  @override
  final String timeSlot;
  final List<String> _seats;
  @override
  List<String> get seats {
    if (_seats is EqualUnmodifiableListView) return _seats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seats);
  }

  @override
  @JsonKey()
  final BookingStatus status;
  @override
  @JsonKey()
  final double totalPrice;
  @override
  @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson)
  final DateTime bookedAt;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookingCopyWith<_Booking> get copyWith =>
      __$BookingCopyWithImpl<_Booking>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Booking &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.movieId, movieId) || other.movieId == movieId) &&
            (identical(other.movieTitle, movieTitle) ||
                other.movieTitle == movieTitle) &&
            (identical(other.moviePosterPath, moviePosterPath) ||
                other.moviePosterPath == moviePosterPath) &&
            (identical(other.cinemaName, cinemaName) ||
                other.cinemaName == cinemaName) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            const DeepCollectionEquality().equals(other._seats, _seats) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.bookedAt, bookedAt) ||
                other.bookedAt == bookedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      movieId,
      movieTitle,
      moviePosterPath,
      cinemaName,
      date,
      timeSlot,
      const DeepCollectionEquality().hash(_seats),
      status,
      totalPrice,
      bookedAt);

  @override
  String toString() {
    return 'Booking(id: $id, movieId: $movieId, movieTitle: $movieTitle, moviePosterPath: $moviePosterPath, cinemaName: $cinemaName, date: $date, timeSlot: $timeSlot, seats: $seats, status: $status, totalPrice: $totalPrice, bookedAt: $bookedAt)';
  }
}

/// @nodoc
abstract mixin class _$BookingCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$BookingCopyWith(_Booking value, $Res Function(_Booking) _then) =
      __$BookingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      int movieId,
      String movieTitle,
      String? moviePosterPath,
      String cinemaName,
      String date,
      String timeSlot,
      List<String> seats,
      BookingStatus status,
      double totalPrice,
      @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson) DateTime bookedAt});
}

/// @nodoc
class __$BookingCopyWithImpl<$Res> implements _$BookingCopyWith<$Res> {
  __$BookingCopyWithImpl(this._self, this._then);

  final _Booking _self;
  final $Res Function(_Booking) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? movieId = null,
    Object? movieTitle = null,
    Object? moviePosterPath = freezed,
    Object? cinemaName = null,
    Object? date = null,
    Object? timeSlot = null,
    Object? seats = null,
    Object? status = null,
    Object? totalPrice = null,
    Object? bookedAt = null,
  }) {
    return _then(_Booking(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      movieId: null == movieId
          ? _self.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
      movieTitle: null == movieTitle
          ? _self.movieTitle
          : movieTitle // ignore: cast_nullable_to_non_nullable
              as String,
      moviePosterPath: freezed == moviePosterPath
          ? _self.moviePosterPath
          : moviePosterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      cinemaName: null == cinemaName
          ? _self.cinemaName
          : cinemaName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      timeSlot: null == timeSlot
          ? _self.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _self._seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingStatus,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      bookedAt: null == bookedAt
          ? _self.bookedAt
          : bookedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$SeatModel {
  String get id; // e.g. "A1"
  bool get isAvailable;
  SeatType get type;

  /// Create a copy of SeatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SeatModelCopyWith<SeatModel> get copyWith =>
      _$SeatModelCopyWithImpl<SeatModel>(this as SeatModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeatModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isAvailable, type);

  @override
  String toString() {
    return 'SeatModel(id: $id, isAvailable: $isAvailable, type: $type)';
  }
}

/// @nodoc
abstract mixin class $SeatModelCopyWith<$Res> {
  factory $SeatModelCopyWith(SeatModel value, $Res Function(SeatModel) _then) =
      _$SeatModelCopyWithImpl;
  @useResult
  $Res call({String id, bool isAvailable, SeatType type});
}

/// @nodoc
class _$SeatModelCopyWithImpl<$Res> implements $SeatModelCopyWith<$Res> {
  _$SeatModelCopyWithImpl(this._self, this._then);

  final SeatModel _self;
  final $Res Function(SeatModel) _then;

  /// Create a copy of SeatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isAvailable = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as SeatType,
    ));
  }
}

/// Adds pattern-matching-related methods to [SeatModel].
extension SeatModelPatterns on SeatModel {
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
    TResult Function(_SeatModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SeatModel() when $default != null:
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
    TResult Function(_SeatModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SeatModel():
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
    TResult? Function(_SeatModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SeatModel() when $default != null:
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
    TResult Function(String id, bool isAvailable, SeatType type)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SeatModel() when $default != null:
        return $default(_that.id, _that.isAvailable, _that.type);
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
    TResult Function(String id, bool isAvailable, SeatType type) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SeatModel():
        return $default(_that.id, _that.isAvailable, _that.type);
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
    TResult? Function(String id, bool isAvailable, SeatType type)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SeatModel() when $default != null:
        return $default(_that.id, _that.isAvailable, _that.type);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SeatModel implements SeatModel {
  const _SeatModel(
      {required this.id, required this.isAvailable, required this.type});

  @override
  final String id;
// e.g. "A1"
  @override
  final bool isAvailable;
  @override
  final SeatType type;

  /// Create a copy of SeatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SeatModelCopyWith<_SeatModel> get copyWith =>
      __$SeatModelCopyWithImpl<_SeatModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SeatModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isAvailable, type);

  @override
  String toString() {
    return 'SeatModel(id: $id, isAvailable: $isAvailable, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$SeatModelCopyWith<$Res>
    implements $SeatModelCopyWith<$Res> {
  factory _$SeatModelCopyWith(
          _SeatModel value, $Res Function(_SeatModel) _then) =
      __$SeatModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, bool isAvailable, SeatType type});
}

/// @nodoc
class __$SeatModelCopyWithImpl<$Res> implements _$SeatModelCopyWith<$Res> {
  __$SeatModelCopyWithImpl(this._self, this._then);

  final _SeatModel _self;
  final $Res Function(_SeatModel) _then;

  /// Create a copy of SeatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? isAvailable = null,
    Object? type = null,
  }) {
    return _then(_SeatModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as SeatType,
    ));
  }
}

// dart format on
