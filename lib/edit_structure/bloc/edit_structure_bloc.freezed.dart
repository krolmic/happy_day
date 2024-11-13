// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_structure_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditStructureEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function() nextStep,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? submitted,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function(Color color)? colorChanged,
    TResult? Function()? nextStep,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function()? nextStep,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_DescriptionChanged value) descriptionChanged,
    required TResult Function(_ColorChanged value) colorChanged,
    required TResult Function(_NextStep value) nextStep,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_DescriptionChanged value)? descriptionChanged,
    TResult? Function(_ColorChanged value)? colorChanged,
    TResult? Function(_NextStep value)? nextStep,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_DescriptionChanged value)? descriptionChanged,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_NextStep value)? nextStep,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditStructureEventCopyWith<$Res> {
  factory $EditStructureEventCopyWith(
          EditStructureEvent value, $Res Function(EditStructureEvent) then) =
      _$EditStructureEventCopyWithImpl<$Res, EditStructureEvent>;
}

/// @nodoc
class _$EditStructureEventCopyWithImpl<$Res, $Val extends EditStructureEvent>
    implements $EditStructureEventCopyWith<$Res> {
  _$EditStructureEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SubmittedImplCopyWith<$Res> {
  factory _$$SubmittedImplCopyWith(
          _$SubmittedImpl value, $Res Function(_$SubmittedImpl) then) =
      __$$SubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmittedImplCopyWithImpl<$Res>
    extends _$EditStructureEventCopyWithImpl<$Res, _$SubmittedImpl>
    implements _$$SubmittedImplCopyWith<$Res> {
  __$$SubmittedImplCopyWithImpl(
      _$SubmittedImpl _value, $Res Function(_$SubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmittedImpl implements _Submitted {
  const _$SubmittedImpl();

  @override
  String toString() {
    return 'EditStructureEvent.submitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function() nextStep,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? submitted,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function(Color color)? colorChanged,
    TResult? Function()? nextStep,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function()? nextStep,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_DescriptionChanged value) descriptionChanged,
    required TResult Function(_ColorChanged value) colorChanged,
    required TResult Function(_NextStep value) nextStep,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_DescriptionChanged value)? descriptionChanged,
    TResult? Function(_ColorChanged value)? colorChanged,
    TResult? Function(_NextStep value)? nextStep,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_DescriptionChanged value)? descriptionChanged,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_NextStep value)? nextStep,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements EditStructureEvent {
  const factory _Submitted() = _$SubmittedImpl;
}

/// @nodoc
abstract class _$$TitleChangedImplCopyWith<$Res> {
  factory _$$TitleChangedImplCopyWith(
          _$TitleChangedImpl value, $Res Function(_$TitleChangedImpl) then) =
      __$$TitleChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$TitleChangedImplCopyWithImpl<$Res>
    extends _$EditStructureEventCopyWithImpl<$Res, _$TitleChangedImpl>
    implements _$$TitleChangedImplCopyWith<$Res> {
  __$$TitleChangedImplCopyWithImpl(
      _$TitleChangedImpl _value, $Res Function(_$TitleChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$TitleChangedImpl(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TitleChangedImpl implements _TitleChanged {
  const _$TitleChangedImpl(this.title);

  @override
  final String title;

  @override
  String toString() {
    return 'EditStructureEvent.titleChanged(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TitleChangedImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TitleChangedImplCopyWith<_$TitleChangedImpl> get copyWith =>
      __$$TitleChangedImplCopyWithImpl<_$TitleChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function() nextStep,
  }) {
    return titleChanged(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? submitted,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function(Color color)? colorChanged,
    TResult? Function()? nextStep,
  }) {
    return titleChanged?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function()? nextStep,
    required TResult orElse(),
  }) {
    if (titleChanged != null) {
      return titleChanged(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_DescriptionChanged value) descriptionChanged,
    required TResult Function(_ColorChanged value) colorChanged,
    required TResult Function(_NextStep value) nextStep,
  }) {
    return titleChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_DescriptionChanged value)? descriptionChanged,
    TResult? Function(_ColorChanged value)? colorChanged,
    TResult? Function(_NextStep value)? nextStep,
  }) {
    return titleChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_DescriptionChanged value)? descriptionChanged,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_NextStep value)? nextStep,
    required TResult orElse(),
  }) {
    if (titleChanged != null) {
      return titleChanged(this);
    }
    return orElse();
  }
}

abstract class _TitleChanged implements EditStructureEvent {
  const factory _TitleChanged(final String title) = _$TitleChangedImpl;

  String get title;

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TitleChangedImplCopyWith<_$TitleChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DescriptionChangedImplCopyWith<$Res> {
  factory _$$DescriptionChangedImplCopyWith(_$DescriptionChangedImpl value,
          $Res Function(_$DescriptionChangedImpl) then) =
      __$$DescriptionChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$DescriptionChangedImplCopyWithImpl<$Res>
    extends _$EditStructureEventCopyWithImpl<$Res, _$DescriptionChangedImpl>
    implements _$$DescriptionChangedImplCopyWith<$Res> {
  __$$DescriptionChangedImplCopyWithImpl(_$DescriptionChangedImpl _value,
      $Res Function(_$DescriptionChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_$DescriptionChangedImpl(
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DescriptionChangedImpl implements _DescriptionChanged {
  const _$DescriptionChangedImpl(this.description);

  @override
  final String description;

  @override
  String toString() {
    return 'EditStructureEvent.descriptionChanged(description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DescriptionChangedImpl &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DescriptionChangedImplCopyWith<_$DescriptionChangedImpl> get copyWith =>
      __$$DescriptionChangedImplCopyWithImpl<_$DescriptionChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function() nextStep,
  }) {
    return descriptionChanged(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? submitted,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function(Color color)? colorChanged,
    TResult? Function()? nextStep,
  }) {
    return descriptionChanged?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function()? nextStep,
    required TResult orElse(),
  }) {
    if (descriptionChanged != null) {
      return descriptionChanged(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_DescriptionChanged value) descriptionChanged,
    required TResult Function(_ColorChanged value) colorChanged,
    required TResult Function(_NextStep value) nextStep,
  }) {
    return descriptionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_DescriptionChanged value)? descriptionChanged,
    TResult? Function(_ColorChanged value)? colorChanged,
    TResult? Function(_NextStep value)? nextStep,
  }) {
    return descriptionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_DescriptionChanged value)? descriptionChanged,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_NextStep value)? nextStep,
    required TResult orElse(),
  }) {
    if (descriptionChanged != null) {
      return descriptionChanged(this);
    }
    return orElse();
  }
}

abstract class _DescriptionChanged implements EditStructureEvent {
  const factory _DescriptionChanged(final String description) =
      _$DescriptionChangedImpl;

  String get description;

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DescriptionChangedImplCopyWith<_$DescriptionChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ColorChangedImplCopyWith<$Res> {
  factory _$$ColorChangedImplCopyWith(
          _$ColorChangedImpl value, $Res Function(_$ColorChangedImpl) then) =
      __$$ColorChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Color color});
}

/// @nodoc
class __$$ColorChangedImplCopyWithImpl<$Res>
    extends _$EditStructureEventCopyWithImpl<$Res, _$ColorChangedImpl>
    implements _$$ColorChangedImplCopyWith<$Res> {
  __$$ColorChangedImplCopyWithImpl(
      _$ColorChangedImpl _value, $Res Function(_$ColorChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_$ColorChangedImpl(
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$ColorChangedImpl implements _ColorChanged {
  const _$ColorChangedImpl(this.color);

  @override
  final Color color;

  @override
  String toString() {
    return 'EditStructureEvent.colorChanged(color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorChangedImpl &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorChangedImplCopyWith<_$ColorChangedImpl> get copyWith =>
      __$$ColorChangedImplCopyWithImpl<_$ColorChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function() nextStep,
  }) {
    return colorChanged(color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? submitted,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function(Color color)? colorChanged,
    TResult? Function()? nextStep,
  }) {
    return colorChanged?.call(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function()? nextStep,
    required TResult orElse(),
  }) {
    if (colorChanged != null) {
      return colorChanged(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_DescriptionChanged value) descriptionChanged,
    required TResult Function(_ColorChanged value) colorChanged,
    required TResult Function(_NextStep value) nextStep,
  }) {
    return colorChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_DescriptionChanged value)? descriptionChanged,
    TResult? Function(_ColorChanged value)? colorChanged,
    TResult? Function(_NextStep value)? nextStep,
  }) {
    return colorChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_DescriptionChanged value)? descriptionChanged,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_NextStep value)? nextStep,
    required TResult orElse(),
  }) {
    if (colorChanged != null) {
      return colorChanged(this);
    }
    return orElse();
  }
}

abstract class _ColorChanged implements EditStructureEvent {
  const factory _ColorChanged(final Color color) = _$ColorChangedImpl;

  Color get color;

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorChangedImplCopyWith<_$ColorChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NextStepImplCopyWith<$Res> {
  factory _$$NextStepImplCopyWith(
          _$NextStepImpl value, $Res Function(_$NextStepImpl) then) =
      __$$NextStepImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextStepImplCopyWithImpl<$Res>
    extends _$EditStructureEventCopyWithImpl<$Res, _$NextStepImpl>
    implements _$$NextStepImplCopyWith<$Res> {
  __$$NextStepImplCopyWithImpl(
      _$NextStepImpl _value, $Res Function(_$NextStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NextStepImpl implements _NextStep {
  const _$NextStepImpl();

  @override
  String toString() {
    return 'EditStructureEvent.nextStep()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NextStepImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function() nextStep,
  }) {
    return nextStep();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? submitted,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function(Color color)? colorChanged,
    TResult? Function()? nextStep,
  }) {
    return nextStep?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function()? nextStep,
    required TResult orElse(),
  }) {
    if (nextStep != null) {
      return nextStep();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_DescriptionChanged value) descriptionChanged,
    required TResult Function(_ColorChanged value) colorChanged,
    required TResult Function(_NextStep value) nextStep,
  }) {
    return nextStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_DescriptionChanged value)? descriptionChanged,
    TResult? Function(_ColorChanged value)? colorChanged,
    TResult? Function(_NextStep value)? nextStep,
  }) {
    return nextStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_DescriptionChanged value)? descriptionChanged,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_NextStep value)? nextStep,
    required TResult orElse(),
  }) {
    if (nextStep != null) {
      return nextStep(this);
    }
    return orElse();
  }
}

abstract class _NextStep implements EditStructureEvent {
  const factory _NextStep() = _$NextStepImpl;
}

/// @nodoc
mixin _$EditStructureState {
  EditStructureStatus get status => throw _privateConstructorUsedError;
  StepsGenerationStatus get stepsGenerationStatus =>
      throw _privateConstructorUsedError;
  Structure? get initialStructure => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<StructureStep> get steps => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;

  /// Create a copy of EditStructureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditStructureStateCopyWith<EditStructureState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditStructureStateCopyWith<$Res> {
  factory $EditStructureStateCopyWith(
          EditStructureState value, $Res Function(EditStructureState) then) =
      _$EditStructureStateCopyWithImpl<$Res, EditStructureState>;
  @useResult
  $Res call(
      {EditStructureStatus status,
      StepsGenerationStatus stepsGenerationStatus,
      Structure? initialStructure,
      String title,
      String description,
      List<StructureStep> steps,
      Color color});

  $StructureCopyWith<$Res>? get initialStructure;
}

/// @nodoc
class _$EditStructureStateCopyWithImpl<$Res, $Val extends EditStructureState>
    implements $EditStructureStateCopyWith<$Res> {
  _$EditStructureStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditStructureState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? stepsGenerationStatus = null,
    Object? initialStructure = freezed,
    Object? title = null,
    Object? description = null,
    Object? steps = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EditStructureStatus,
      stepsGenerationStatus: null == stepsGenerationStatus
          ? _value.stepsGenerationStatus
          : stepsGenerationStatus // ignore: cast_nullable_to_non_nullable
              as StepsGenerationStatus,
      initialStructure: freezed == initialStructure
          ? _value.initialStructure
          : initialStructure // ignore: cast_nullable_to_non_nullable
              as Structure?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StructureStep>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }

  /// Create a copy of EditStructureState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructureCopyWith<$Res>? get initialStructure {
    if (_value.initialStructure == null) {
      return null;
    }

    return $StructureCopyWith<$Res>(_value.initialStructure!, (value) {
      return _then(_value.copyWith(initialStructure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditStructureStateImplCopyWith<$Res>
    implements $EditStructureStateCopyWith<$Res> {
  factory _$$EditStructureStateImplCopyWith(_$EditStructureStateImpl value,
          $Res Function(_$EditStructureStateImpl) then) =
      __$$EditStructureStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EditStructureStatus status,
      StepsGenerationStatus stepsGenerationStatus,
      Structure? initialStructure,
      String title,
      String description,
      List<StructureStep> steps,
      Color color});

  @override
  $StructureCopyWith<$Res>? get initialStructure;
}

/// @nodoc
class __$$EditStructureStateImplCopyWithImpl<$Res>
    extends _$EditStructureStateCopyWithImpl<$Res, _$EditStructureStateImpl>
    implements _$$EditStructureStateImplCopyWith<$Res> {
  __$$EditStructureStateImplCopyWithImpl(_$EditStructureStateImpl _value,
      $Res Function(_$EditStructureStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditStructureState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? stepsGenerationStatus = null,
    Object? initialStructure = freezed,
    Object? title = null,
    Object? description = null,
    Object? steps = null,
    Object? color = null,
  }) {
    return _then(_$EditStructureStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EditStructureStatus,
      stepsGenerationStatus: null == stepsGenerationStatus
          ? _value.stepsGenerationStatus
          : stepsGenerationStatus // ignore: cast_nullable_to_non_nullable
              as StepsGenerationStatus,
      initialStructure: freezed == initialStructure
          ? _value.initialStructure
          : initialStructure // ignore: cast_nullable_to_non_nullable
              as Structure?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StructureStep>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$EditStructureStateImpl implements _EditStructureState {
  const _$EditStructureStateImpl(
      {this.status = EditStructureStatus.initial,
      this.stepsGenerationStatus = StepsGenerationStatus.initial,
      this.initialStructure,
      this.title = '',
      this.description = '',
      final List<StructureStep> steps = const [],
      this.color = Colors.orange})
      : _steps = steps;

  @override
  @JsonKey()
  final EditStructureStatus status;
  @override
  @JsonKey()
  final StepsGenerationStatus stepsGenerationStatus;
  @override
  final Structure? initialStructure;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  final List<StructureStep> _steps;
  @override
  @JsonKey()
  List<StructureStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  @JsonKey()
  final Color color;

  @override
  String toString() {
    return 'EditStructureState(status: $status, stepsGenerationStatus: $stepsGenerationStatus, initialStructure: $initialStructure, title: $title, description: $description, steps: $steps, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditStructureStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stepsGenerationStatus, stepsGenerationStatus) ||
                other.stepsGenerationStatus == stepsGenerationStatus) &&
            (identical(other.initialStructure, initialStructure) ||
                other.initialStructure == initialStructure) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      stepsGenerationStatus,
      initialStructure,
      title,
      description,
      const DeepCollectionEquality().hash(_steps),
      color);

  /// Create a copy of EditStructureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditStructureStateImplCopyWith<_$EditStructureStateImpl> get copyWith =>
      __$$EditStructureStateImplCopyWithImpl<_$EditStructureStateImpl>(
          this, _$identity);
}

abstract class _EditStructureState implements EditStructureState {
  const factory _EditStructureState(
      {final EditStructureStatus status,
      final StepsGenerationStatus stepsGenerationStatus,
      final Structure? initialStructure,
      final String title,
      final String description,
      final List<StructureStep> steps,
      final Color color}) = _$EditStructureStateImpl;

  @override
  EditStructureStatus get status;
  @override
  StepsGenerationStatus get stepsGenerationStatus;
  @override
  Structure? get initialStructure;
  @override
  String get title;
  @override
  String get description;
  @override
  List<StructureStep> get steps;
  @override
  Color get color;

  /// Create a copy of EditStructureState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditStructureStateImplCopyWith<_$EditStructureStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
