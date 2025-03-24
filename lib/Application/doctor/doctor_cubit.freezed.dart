// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorState {
  bool get isLoading;
  Option<Either<MainFailure, List<DoctorModel>>> get doctors;
  Option<Either<MainFailure, Unit>> get bookAppointment;

  /// Create a copy of DoctorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DoctorStateCopyWith<DoctorState> get copyWith =>
      _$DoctorStateCopyWithImpl<DoctorState>(this as DoctorState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DoctorState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.doctors, doctors) || other.doctors == doctors) &&
            (identical(other.bookAppointment, bookAppointment) ||
                other.bookAppointment == bookAppointment));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, doctors, bookAppointment);

  @override
  String toString() {
    return 'DoctorState(isLoading: $isLoading, doctors: $doctors, bookAppointment: $bookAppointment)';
  }
}

/// @nodoc
abstract mixin class $DoctorStateCopyWith<$Res> {
  factory $DoctorStateCopyWith(
          DoctorState value, $Res Function(DoctorState) _then) =
      _$DoctorStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, List<DoctorModel>>> doctors,
      Option<Either<MainFailure, Unit>> bookAppointment});
}

/// @nodoc
class _$DoctorStateCopyWithImpl<$Res> implements $DoctorStateCopyWith<$Res> {
  _$DoctorStateCopyWithImpl(this._self, this._then);

  final DoctorState _self;
  final $Res Function(DoctorState) _then;

  /// Create a copy of DoctorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? doctors = null,
    Object? bookAppointment = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      doctors: null == doctors
          ? _self.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<DoctorModel>>>,
      bookAppointment: null == bookAppointment
          ? _self.bookAppointment
          : bookAppointment // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _Initial implements DoctorState {
  const _Initial(
      {required this.isLoading,
      required this.doctors,
      required this.bookAppointment});

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, List<DoctorModel>>> doctors;
  @override
  final Option<Either<MainFailure, Unit>> bookAppointment;

  /// Create a copy of DoctorState
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
            (identical(other.doctors, doctors) || other.doctors == doctors) &&
            (identical(other.bookAppointment, bookAppointment) ||
                other.bookAppointment == bookAppointment));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, doctors, bookAppointment);

  @override
  String toString() {
    return 'DoctorState(isLoading: $isLoading, doctors: $doctors, bookAppointment: $bookAppointment)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $DoctorStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, List<DoctorModel>>> doctors,
      Option<Either<MainFailure, Unit>> bookAppointment});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of DoctorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? doctors = null,
    Object? bookAppointment = null,
  }) {
    return _then(_Initial(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      doctors: null == doctors
          ? _self.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<DoctorModel>>>,
      bookAppointment: null == bookAppointment
          ? _self.bookAppointment
          : bookAppointment // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
    ));
  }
}

// dart format on
