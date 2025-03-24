// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrescriptionState {
  bool get isLoading;
  Option<Either<MainFailure, List<PresciptionModel>>> get prescription;

  /// Create a copy of PrescriptionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PrescriptionStateCopyWith<PrescriptionState> get copyWith =>
      _$PrescriptionStateCopyWithImpl<PrescriptionState>(
          this as PrescriptionState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrescriptionState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.prescription, prescription) ||
                other.prescription == prescription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, prescription);

  @override
  String toString() {
    return 'PrescriptionState(isLoading: $isLoading, prescription: $prescription)';
  }
}

/// @nodoc
abstract mixin class $PrescriptionStateCopyWith<$Res> {
  factory $PrescriptionStateCopyWith(
          PrescriptionState value, $Res Function(PrescriptionState) _then) =
      _$PrescriptionStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, List<PresciptionModel>>> prescription});
}

/// @nodoc
class _$PrescriptionStateCopyWithImpl<$Res>
    implements $PrescriptionStateCopyWith<$Res> {
  _$PrescriptionStateCopyWithImpl(this._self, this._then);

  final PrescriptionState _self;
  final $Res Function(PrescriptionState) _then;

  /// Create a copy of PrescriptionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? prescription = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      prescription: null == prescription
          ? _self.prescription
          : prescription // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<PresciptionModel>>>,
    ));
  }
}

/// @nodoc

class _Initial implements PrescriptionState {
  const _Initial({required this.isLoading, required this.prescription});

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, List<PresciptionModel>>> prescription;

  /// Create a copy of PrescriptionState
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
            (identical(other.prescription, prescription) ||
                other.prescription == prescription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, prescription);

  @override
  String toString() {
    return 'PrescriptionState(isLoading: $isLoading, prescription: $prescription)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $PrescriptionStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, List<PresciptionModel>>> prescription});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of PrescriptionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? prescription = null,
  }) {
    return _then(_Initial(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      prescription: null == prescription
          ? _self.prescription
          : prescription // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<PresciptionModel>>>,
    ));
  }
}

// dart format on
