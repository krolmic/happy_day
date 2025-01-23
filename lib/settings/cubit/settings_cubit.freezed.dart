// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsState {
  SendEmailState get sendEmailState => throw _privateConstructorUsedError;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call({SendEmailState sendEmailState});

  $SendEmailStateCopyWith<$Res> get sendEmailState;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendEmailState = null,
  }) {
    return _then(_value.copyWith(
      sendEmailState: null == sendEmailState
          ? _value.sendEmailState
          : sendEmailState // ignore: cast_nullable_to_non_nullable
              as SendEmailState,
    ) as $Val);
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SendEmailStateCopyWith<$Res> get sendEmailState {
    return $SendEmailStateCopyWith<$Res>(_value.sendEmailState, (value) {
      return _then(_value.copyWith(sendEmailState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
          _$SettingsStateImpl value, $Res Function(_$SettingsStateImpl) then) =
      __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SendEmailState sendEmailState});

  @override
  $SendEmailStateCopyWith<$Res> get sendEmailState;
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
      _$SettingsStateImpl _value, $Res Function(_$SettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendEmailState = null,
  }) {
    return _then(_$SettingsStateImpl(
      sendEmailState: null == sendEmailState
          ? _value.sendEmailState
          : sendEmailState // ignore: cast_nullable_to_non_nullable
              as SendEmailState,
    ));
  }
}

/// @nodoc

class _$SettingsStateImpl implements _SettingsState {
  const _$SettingsStateImpl(
      {this.sendEmailState = const SendEmailState.initial()});

  @override
  @JsonKey()
  final SendEmailState sendEmailState;

  @override
  String toString() {
    return 'SettingsState(sendEmailState: $sendEmailState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.sendEmailState, sendEmailState) ||
                other.sendEmailState == sendEmailState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendEmailState);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState({final SendEmailState sendEmailState}) =
      _$SettingsStateImpl;

  @override
  SendEmailState get sendEmailState;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SendEmailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendEmailStateInitialState value) initial,
    required TResult Function(_SendEmailStateLoadingState value) loading,
    required TResult Function(_SendEmailStateSuccessState value) success,
    required TResult Function(_SendEmailStateFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendEmailStateInitialState value)? initial,
    TResult? Function(_SendEmailStateLoadingState value)? loading,
    TResult? Function(_SendEmailStateSuccessState value)? success,
    TResult? Function(_SendEmailStateFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendEmailStateInitialState value)? initial,
    TResult Function(_SendEmailStateLoadingState value)? loading,
    TResult Function(_SendEmailStateSuccessState value)? success,
    TResult Function(_SendEmailStateFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendEmailStateCopyWith<$Res> {
  factory $SendEmailStateCopyWith(
          SendEmailState value, $Res Function(SendEmailState) then) =
      _$SendEmailStateCopyWithImpl<$Res, SendEmailState>;
}

/// @nodoc
class _$SendEmailStateCopyWithImpl<$Res, $Val extends SendEmailState>
    implements $SendEmailStateCopyWith<$Res> {
  _$SendEmailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendEmailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SendEmailStateInitialStateImplCopyWith<$Res> {
  factory _$$SendEmailStateInitialStateImplCopyWith(
          _$SendEmailStateInitialStateImpl value,
          $Res Function(_$SendEmailStateInitialStateImpl) then) =
      __$$SendEmailStateInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendEmailStateInitialStateImplCopyWithImpl<$Res>
    extends _$SendEmailStateCopyWithImpl<$Res, _$SendEmailStateInitialStateImpl>
    implements _$$SendEmailStateInitialStateImplCopyWith<$Res> {
  __$$SendEmailStateInitialStateImplCopyWithImpl(
      _$SendEmailStateInitialStateImpl _value,
      $Res Function(_$SendEmailStateInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendEmailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendEmailStateInitialStateImpl implements _SendEmailStateInitialState {
  const _$SendEmailStateInitialStateImpl();

  @override
  String toString() {
    return 'SendEmailState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEmailStateInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendEmailStateInitialState value) initial,
    required TResult Function(_SendEmailStateLoadingState value) loading,
    required TResult Function(_SendEmailStateSuccessState value) success,
    required TResult Function(_SendEmailStateFailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendEmailStateInitialState value)? initial,
    TResult? Function(_SendEmailStateLoadingState value)? loading,
    TResult? Function(_SendEmailStateSuccessState value)? success,
    TResult? Function(_SendEmailStateFailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendEmailStateInitialState value)? initial,
    TResult Function(_SendEmailStateLoadingState value)? loading,
    TResult Function(_SendEmailStateSuccessState value)? success,
    TResult Function(_SendEmailStateFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SendEmailStateInitialState implements SendEmailState {
  const factory _SendEmailStateInitialState() =
      _$SendEmailStateInitialStateImpl;
}

/// @nodoc
abstract class _$$SendEmailStateLoadingStateImplCopyWith<$Res> {
  factory _$$SendEmailStateLoadingStateImplCopyWith(
          _$SendEmailStateLoadingStateImpl value,
          $Res Function(_$SendEmailStateLoadingStateImpl) then) =
      __$$SendEmailStateLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendEmailStateLoadingStateImplCopyWithImpl<$Res>
    extends _$SendEmailStateCopyWithImpl<$Res, _$SendEmailStateLoadingStateImpl>
    implements _$$SendEmailStateLoadingStateImplCopyWith<$Res> {
  __$$SendEmailStateLoadingStateImplCopyWithImpl(
      _$SendEmailStateLoadingStateImpl _value,
      $Res Function(_$SendEmailStateLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendEmailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendEmailStateLoadingStateImpl implements _SendEmailStateLoadingState {
  const _$SendEmailStateLoadingStateImpl();

  @override
  String toString() {
    return 'SendEmailState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEmailStateLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendEmailStateInitialState value) initial,
    required TResult Function(_SendEmailStateLoadingState value) loading,
    required TResult Function(_SendEmailStateSuccessState value) success,
    required TResult Function(_SendEmailStateFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendEmailStateInitialState value)? initial,
    TResult? Function(_SendEmailStateLoadingState value)? loading,
    TResult? Function(_SendEmailStateSuccessState value)? success,
    TResult? Function(_SendEmailStateFailureState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendEmailStateInitialState value)? initial,
    TResult Function(_SendEmailStateLoadingState value)? loading,
    TResult Function(_SendEmailStateSuccessState value)? success,
    TResult Function(_SendEmailStateFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SendEmailStateLoadingState implements SendEmailState {
  const factory _SendEmailStateLoadingState() =
      _$SendEmailStateLoadingStateImpl;
}

/// @nodoc
abstract class _$$SendEmailStateSuccessStateImplCopyWith<$Res> {
  factory _$$SendEmailStateSuccessStateImplCopyWith(
          _$SendEmailStateSuccessStateImpl value,
          $Res Function(_$SendEmailStateSuccessStateImpl) then) =
      __$$SendEmailStateSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendEmailStateSuccessStateImplCopyWithImpl<$Res>
    extends _$SendEmailStateCopyWithImpl<$Res, _$SendEmailStateSuccessStateImpl>
    implements _$$SendEmailStateSuccessStateImplCopyWith<$Res> {
  __$$SendEmailStateSuccessStateImplCopyWithImpl(
      _$SendEmailStateSuccessStateImpl _value,
      $Res Function(_$SendEmailStateSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendEmailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendEmailStateSuccessStateImpl implements _SendEmailStateSuccessState {
  const _$SendEmailStateSuccessStateImpl();

  @override
  String toString() {
    return 'SendEmailState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEmailStateSuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendEmailStateInitialState value) initial,
    required TResult Function(_SendEmailStateLoadingState value) loading,
    required TResult Function(_SendEmailStateSuccessState value) success,
    required TResult Function(_SendEmailStateFailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendEmailStateInitialState value)? initial,
    TResult? Function(_SendEmailStateLoadingState value)? loading,
    TResult? Function(_SendEmailStateSuccessState value)? success,
    TResult? Function(_SendEmailStateFailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendEmailStateInitialState value)? initial,
    TResult Function(_SendEmailStateLoadingState value)? loading,
    TResult Function(_SendEmailStateSuccessState value)? success,
    TResult Function(_SendEmailStateFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SendEmailStateSuccessState implements SendEmailState {
  const factory _SendEmailStateSuccessState() =
      _$SendEmailStateSuccessStateImpl;
}

/// @nodoc
abstract class _$$SendEmailStateFailureStateImplCopyWith<$Res> {
  factory _$$SendEmailStateFailureStateImplCopyWith(
          _$SendEmailStateFailureStateImpl value,
          $Res Function(_$SendEmailStateFailureStateImpl) then) =
      __$$SendEmailStateFailureStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendEmailStateFailureStateImplCopyWithImpl<$Res>
    extends _$SendEmailStateCopyWithImpl<$Res, _$SendEmailStateFailureStateImpl>
    implements _$$SendEmailStateFailureStateImplCopyWith<$Res> {
  __$$SendEmailStateFailureStateImplCopyWithImpl(
      _$SendEmailStateFailureStateImpl _value,
      $Res Function(_$SendEmailStateFailureStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendEmailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendEmailStateFailureStateImpl implements _SendEmailStateFailureState {
  const _$SendEmailStateFailureStateImpl();

  @override
  String toString() {
    return 'SendEmailState.failure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEmailStateFailureStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendEmailStateInitialState value) initial,
    required TResult Function(_SendEmailStateLoadingState value) loading,
    required TResult Function(_SendEmailStateSuccessState value) success,
    required TResult Function(_SendEmailStateFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendEmailStateInitialState value)? initial,
    TResult? Function(_SendEmailStateLoadingState value)? loading,
    TResult? Function(_SendEmailStateSuccessState value)? success,
    TResult? Function(_SendEmailStateFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendEmailStateInitialState value)? initial,
    TResult Function(_SendEmailStateLoadingState value)? loading,
    TResult Function(_SendEmailStateSuccessState value)? success,
    TResult Function(_SendEmailStateFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _SendEmailStateFailureState implements SendEmailState {
  const factory _SendEmailStateFailureState() =
      _$SendEmailStateFailureStateImpl;
}
