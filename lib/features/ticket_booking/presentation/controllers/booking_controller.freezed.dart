// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingState {
  String get selectedDate;
  String get selectedTimeSlot;
  String get selectedCinema;
  List<String> get selectedSeats;
  bool get isLoading;
  String? get errorMessage;
  Booking? get confirmedBooking;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookingStateCopyWith<BookingState> get copyWith =>
      _$BookingStateCopyWithImpl<BookingState>(
          this as BookingState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookingState &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedTimeSlot, selectedTimeSlot) ||
                other.selectedTimeSlot == selectedTimeSlot) &&
            (identical(other.selectedCinema, selectedCinema) ||
                other.selectedCinema == selectedCinema) &&
            const DeepCollectionEquality()
                .equals(other.selectedSeats, selectedSeats) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.confirmedBooking, confirmedBooking) ||
                other.confirmedBooking == confirmedBooking));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedDate,
      selectedTimeSlot,
      selectedCinema,
      const DeepCollectionEquality().hash(selectedSeats),
      isLoading,
      errorMessage,
      confirmedBooking);

  @override
  String toString() {
    return 'BookingState(selectedDate: $selectedDate, selectedTimeSlot: $selectedTimeSlot, selectedCinema: $selectedCinema, selectedSeats: $selectedSeats, isLoading: $isLoading, errorMessage: $errorMessage, confirmedBooking: $confirmedBooking)';
  }
}

/// @nodoc
abstract mixin class $BookingStateCopyWith<$Res> {
  factory $BookingStateCopyWith(
          BookingState value, $Res Function(BookingState) _then) =
      _$BookingStateCopyWithImpl;
  @useResult
  $Res call(
      {String selectedDate,
      String selectedTimeSlot,
      String selectedCinema,
      List<String> selectedSeats,
      bool isLoading,
      String? errorMessage,
      Booking? confirmedBooking});

  $BookingCopyWith<$Res>? get confirmedBooking;
}

/// @nodoc
class _$BookingStateCopyWithImpl<$Res> implements $BookingStateCopyWith<$Res> {
  _$BookingStateCopyWithImpl(this._self, this._then);

  final BookingState _self;
  final $Res Function(BookingState) _then;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
    Object? selectedTimeSlot = null,
    Object? selectedCinema = null,
    Object? selectedSeats = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? confirmedBooking = freezed,
  }) {
    return _then(_self.copyWith(
      selectedDate: null == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTimeSlot: null == selectedTimeSlot
          ? _self.selectedTimeSlot
          : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCinema: null == selectedCinema
          ? _self.selectedCinema
          : selectedCinema // ignore: cast_nullable_to_non_nullable
              as String,
      selectedSeats: null == selectedSeats
          ? _self.selectedSeats
          : selectedSeats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmedBooking: freezed == confirmedBooking
          ? _self.confirmedBooking
          : confirmedBooking // ignore: cast_nullable_to_non_nullable
              as Booking?,
    ));
  }

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingCopyWith<$Res>? get confirmedBooking {
    if (_self.confirmedBooking == null) {
      return null;
    }

    return $BookingCopyWith<$Res>(_self.confirmedBooking!, (value) {
      return _then(_self.copyWith(confirmedBooking: value));
    });
  }
}

/// Adds pattern-matching-related methods to [BookingState].
extension BookingStatePatterns on BookingState {
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
    TResult Function(_BookingState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BookingState() when $default != null:
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
    TResult Function(_BookingState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BookingState():
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
    TResult? Function(_BookingState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BookingState() when $default != null:
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
            String selectedDate,
            String selectedTimeSlot,
            String selectedCinema,
            List<String> selectedSeats,
            bool isLoading,
            String? errorMessage,
            Booking? confirmedBooking)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BookingState() when $default != null:
        return $default(
            _that.selectedDate,
            _that.selectedTimeSlot,
            _that.selectedCinema,
            _that.selectedSeats,
            _that.isLoading,
            _that.errorMessage,
            _that.confirmedBooking);
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
            String selectedDate,
            String selectedTimeSlot,
            String selectedCinema,
            List<String> selectedSeats,
            bool isLoading,
            String? errorMessage,
            Booking? confirmedBooking)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BookingState():
        return $default(
            _that.selectedDate,
            _that.selectedTimeSlot,
            _that.selectedCinema,
            _that.selectedSeats,
            _that.isLoading,
            _that.errorMessage,
            _that.confirmedBooking);
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
            String selectedDate,
            String selectedTimeSlot,
            String selectedCinema,
            List<String> selectedSeats,
            bool isLoading,
            String? errorMessage,
            Booking? confirmedBooking)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BookingState() when $default != null:
        return $default(
            _that.selectedDate,
            _that.selectedTimeSlot,
            _that.selectedCinema,
            _that.selectedSeats,
            _that.isLoading,
            _that.errorMessage,
            _that.confirmedBooking);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BookingState implements BookingState {
  const _BookingState(
      {this.selectedDate = '',
      this.selectedTimeSlot = '',
      this.selectedCinema = '',
      final List<String> selectedSeats = const [],
      this.isLoading = false,
      this.errorMessage,
      this.confirmedBooking})
      : _selectedSeats = selectedSeats;

  @override
  @JsonKey()
  final String selectedDate;
  @override
  @JsonKey()
  final String selectedTimeSlot;
  @override
  @JsonKey()
  final String selectedCinema;
  final List<String> _selectedSeats;
  @override
  @JsonKey()
  List<String> get selectedSeats {
    if (_selectedSeats is EqualUnmodifiableListView) return _selectedSeats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedSeats);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  final Booking? confirmedBooking;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookingStateCopyWith<_BookingState> get copyWith =>
      __$BookingStateCopyWithImpl<_BookingState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookingState &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedTimeSlot, selectedTimeSlot) ||
                other.selectedTimeSlot == selectedTimeSlot) &&
            (identical(other.selectedCinema, selectedCinema) ||
                other.selectedCinema == selectedCinema) &&
            const DeepCollectionEquality()
                .equals(other._selectedSeats, _selectedSeats) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.confirmedBooking, confirmedBooking) ||
                other.confirmedBooking == confirmedBooking));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedDate,
      selectedTimeSlot,
      selectedCinema,
      const DeepCollectionEquality().hash(_selectedSeats),
      isLoading,
      errorMessage,
      confirmedBooking);

  @override
  String toString() {
    return 'BookingState(selectedDate: $selectedDate, selectedTimeSlot: $selectedTimeSlot, selectedCinema: $selectedCinema, selectedSeats: $selectedSeats, isLoading: $isLoading, errorMessage: $errorMessage, confirmedBooking: $confirmedBooking)';
  }
}

/// @nodoc
abstract mixin class _$BookingStateCopyWith<$Res>
    implements $BookingStateCopyWith<$Res> {
  factory _$BookingStateCopyWith(
          _BookingState value, $Res Function(_BookingState) _then) =
      __$BookingStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String selectedDate,
      String selectedTimeSlot,
      String selectedCinema,
      List<String> selectedSeats,
      bool isLoading,
      String? errorMessage,
      Booking? confirmedBooking});

  @override
  $BookingCopyWith<$Res>? get confirmedBooking;
}

/// @nodoc
class __$BookingStateCopyWithImpl<$Res>
    implements _$BookingStateCopyWith<$Res> {
  __$BookingStateCopyWithImpl(this._self, this._then);

  final _BookingState _self;
  final $Res Function(_BookingState) _then;

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedDate = null,
    Object? selectedTimeSlot = null,
    Object? selectedCinema = null,
    Object? selectedSeats = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? confirmedBooking = freezed,
  }) {
    return _then(_BookingState(
      selectedDate: null == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTimeSlot: null == selectedTimeSlot
          ? _self.selectedTimeSlot
          : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCinema: null == selectedCinema
          ? _self.selectedCinema
          : selectedCinema // ignore: cast_nullable_to_non_nullable
              as String,
      selectedSeats: null == selectedSeats
          ? _self._selectedSeats
          : selectedSeats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmedBooking: freezed == confirmedBooking
          ? _self.confirmedBooking
          : confirmedBooking // ignore: cast_nullable_to_non_nullable
              as Booking?,
    ));
  }

  /// Create a copy of BookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingCopyWith<$Res>? get confirmedBooking {
    if (_self.confirmedBooking == null) {
      return null;
    }

    return $BookingCopyWith<$Res>(_self.confirmedBooking!, (value) {
      return _then(_self.copyWith(confirmedBooking: value));
    });
  }
}

// dart format on
