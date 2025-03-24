// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState {
  bool get isLoading;
  Option<Either<MainFailure, BookingModel>> get bookings;
  Option<Either<MainFailure, BookingModel>> get prevBookings;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeStateCopyWith<HomeState> get copyWith =>
      _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.bookings, bookings) ||
                other.bookings == bookings) &&
            (identical(other.prevBookings, prevBookings) ||
                other.prevBookings == prevBookings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, bookings, prevBookings);

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, bookings: $bookings, prevBookings: $prevBookings)';
  }
}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) =
      _$HomeStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, BookingModel>> bookings,
      Option<Either<MainFailure, BookingModel>> prevBookings});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bookings = null,
    Object? prevBookings = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bookings: null == bookings
          ? _self.bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, BookingModel>>,
      prevBookings: null == prevBookings
          ? _self.prevBookings
          : prevBookings // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, BookingModel>>,
    ));
  }
}

/// @nodoc

class _Initial implements HomeState {
  const _Initial(
      {required this.isLoading,
      required this.bookings,
      required this.prevBookings});

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, BookingModel>> bookings;
  @override
  final Option<Either<MainFailure, BookingModel>> prevBookings;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.bookings, bookings) ||
                other.bookings == bookings) &&
            (identical(other.prevBookings, prevBookings) ||
                other.prevBookings == prevBookings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, bookings, prevBookings);

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, bookings: $bookings, prevBookings: $prevBookings)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, BookingModel>> bookings,
      Option<Either<MainFailure, BookingModel>> prevBookings});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? bookings = null,
    Object? prevBookings = null,
  }) {
    return _then(_Initial(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bookings: null == bookings
          ? _self.bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, BookingModel>>,
      prevBookings: null == prevBookings
          ? _self.prevBookings
          : prevBookings // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, BookingModel>>,
    ));
  }
}

// dart format on
