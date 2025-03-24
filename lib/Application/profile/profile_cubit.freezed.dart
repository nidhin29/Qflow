// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileState {
  bool get isLoading;
  Option<Either<MainFailure, Model>> get isFailureOrSuccessForGet;
  Option<Either<MainFailure, Unit>> get isFailureOrSuccessForUpdate;
  Option<Either<MainFailure, Unit>> get isFailureOrSuccessForDelete;
  Model? get profileModel;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      _$ProfileStateCopyWithImpl<ProfileState>(
          this as ProfileState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(
                    other.isFailureOrSuccessForGet, isFailureOrSuccessForGet) ||
                other.isFailureOrSuccessForGet == isFailureOrSuccessForGet) &&
            (identical(other.isFailureOrSuccessForUpdate,
                    isFailureOrSuccessForUpdate) ||
                other.isFailureOrSuccessForUpdate ==
                    isFailureOrSuccessForUpdate) &&
            (identical(other.isFailureOrSuccessForDelete,
                    isFailureOrSuccessForDelete) ||
                other.isFailureOrSuccessForDelete ==
                    isFailureOrSuccessForDelete) &&
            (identical(other.profileModel, profileModel) ||
                other.profileModel == profileModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isFailureOrSuccessForGet,
      isFailureOrSuccessForUpdate,
      isFailureOrSuccessForDelete,
      profileModel);

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, isFailureOrSuccessForGet: $isFailureOrSuccessForGet, isFailureOrSuccessForUpdate: $isFailureOrSuccessForUpdate, isFailureOrSuccessForDelete: $isFailureOrSuccessForDelete, profileModel: $profileModel)';
  }
}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) _then) =
      _$ProfileStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, Model>> isFailureOrSuccessForGet,
      Option<Either<MainFailure, Unit>> isFailureOrSuccessForUpdate,
      Option<Either<MainFailure, Unit>> isFailureOrSuccessForDelete,
      Model? profileModel});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res> implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailureOrSuccessForGet = null,
    Object? isFailureOrSuccessForUpdate = null,
    Object? isFailureOrSuccessForDelete = null,
    Object? profileModel = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccessForGet: null == isFailureOrSuccessForGet
          ? _self.isFailureOrSuccessForGet
          : isFailureOrSuccessForGet // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Model>>,
      isFailureOrSuccessForUpdate: null == isFailureOrSuccessForUpdate
          ? _self.isFailureOrSuccessForUpdate
          : isFailureOrSuccessForUpdate // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
      isFailureOrSuccessForDelete: null == isFailureOrSuccessForDelete
          ? _self.isFailureOrSuccessForDelete
          : isFailureOrSuccessForDelete // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
      profileModel: freezed == profileModel
          ? _self.profileModel
          : profileModel // ignore: cast_nullable_to_non_nullable
              as Model?,
    ));
  }
}

/// @nodoc

class _Initial implements ProfileState {
  const _Initial(
      {required this.isLoading,
      required this.isFailureOrSuccessForGet,
      required this.isFailureOrSuccessForUpdate,
      required this.isFailureOrSuccessForDelete,
      required this.profileModel});

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, Model>> isFailureOrSuccessForGet;
  @override
  final Option<Either<MainFailure, Unit>> isFailureOrSuccessForUpdate;
  @override
  final Option<Either<MainFailure, Unit>> isFailureOrSuccessForDelete;
  @override
  final Model? profileModel;

  /// Create a copy of ProfileState
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
            (identical(
                    other.isFailureOrSuccessForGet, isFailureOrSuccessForGet) ||
                other.isFailureOrSuccessForGet == isFailureOrSuccessForGet) &&
            (identical(other.isFailureOrSuccessForUpdate,
                    isFailureOrSuccessForUpdate) ||
                other.isFailureOrSuccessForUpdate ==
                    isFailureOrSuccessForUpdate) &&
            (identical(other.isFailureOrSuccessForDelete,
                    isFailureOrSuccessForDelete) ||
                other.isFailureOrSuccessForDelete ==
                    isFailureOrSuccessForDelete) &&
            (identical(other.profileModel, profileModel) ||
                other.profileModel == profileModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isFailureOrSuccessForGet,
      isFailureOrSuccessForUpdate,
      isFailureOrSuccessForDelete,
      profileModel);

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, isFailureOrSuccessForGet: $isFailureOrSuccessForGet, isFailureOrSuccessForUpdate: $isFailureOrSuccessForUpdate, isFailureOrSuccessForDelete: $isFailureOrSuccessForDelete, profileModel: $profileModel)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, Model>> isFailureOrSuccessForGet,
      Option<Either<MainFailure, Unit>> isFailureOrSuccessForUpdate,
      Option<Either<MainFailure, Unit>> isFailureOrSuccessForDelete,
      Model? profileModel});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? isFailureOrSuccessForGet = null,
    Object? isFailureOrSuccessForUpdate = null,
    Object? isFailureOrSuccessForDelete = null,
    Object? profileModel = freezed,
  }) {
    return _then(_Initial(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccessForGet: null == isFailureOrSuccessForGet
          ? _self.isFailureOrSuccessForGet
          : isFailureOrSuccessForGet // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Model>>,
      isFailureOrSuccessForUpdate: null == isFailureOrSuccessForUpdate
          ? _self.isFailureOrSuccessForUpdate
          : isFailureOrSuccessForUpdate // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
      isFailureOrSuccessForDelete: null == isFailureOrSuccessForDelete
          ? _self.isFailureOrSuccessForDelete
          : isFailureOrSuccessForDelete // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
      profileModel: freezed == profileModel
          ? _self.profileModel
          : profileModel // ignore: cast_nullable_to_non_nullable
              as Model?,
    ));
  }
}

// dart format on
