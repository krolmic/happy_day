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
    required TResult Function(int index, String title) stepChanged,
    required TResult Function(int index) stepRemoved,
    required TResult Function() stepAdded,
    required TResult Function(int oldIndex, int newIndex) stepReordered,
    required TResult Function() structureDeleted,
    required TResult Function(int index) weekDayTriggered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? submitted,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function(Color color)? colorChanged,
    TResult? Function()? nextStep,
    TResult? Function(int index, String title)? stepChanged,
    TResult? Function(int index)? stepRemoved,
    TResult? Function()? stepAdded,
    TResult? Function(int oldIndex, int newIndex)? stepReordered,
    TResult? Function()? structureDeleted,
    TResult? Function(int index)? weekDayTriggered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function()? nextStep,
    TResult Function(int index, String title)? stepChanged,
    TResult Function(int index)? stepRemoved,
    TResult Function()? stepAdded,
    TResult Function(int oldIndex, int newIndex)? stepReordered,
    TResult Function()? structureDeleted,
    TResult Function(int index)? weekDayTriggered,
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
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_StepRemoved value) stepRemoved,
    required TResult Function(_StepAdded value) stepAdded,
    required TResult Function(_StepReordered value) stepReordered,
    required TResult Function(_StructureDeleted value) structureDeleted,
    required TResult Function(_WeekDayTriggered value) weekDayTriggered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_DescriptionChanged value)? descriptionChanged,
    TResult? Function(_ColorChanged value)? colorChanged,
    TResult? Function(_NextStep value)? nextStep,
    TResult? Function(_StepChanged value)? stepChanged,
    TResult? Function(_StepRemoved value)? stepRemoved,
    TResult? Function(_StepAdded value)? stepAdded,
    TResult? Function(_StepReordered value)? stepReordered,
    TResult? Function(_StructureDeleted value)? structureDeleted,
    TResult? Function(_WeekDayTriggered value)? weekDayTriggered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_DescriptionChanged value)? descriptionChanged,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_NextStep value)? nextStep,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_StepRemoved value)? stepRemoved,
    TResult Function(_StepAdded value)? stepAdded,
    TResult Function(_StepReordered value)? stepReordered,
    TResult Function(_StructureDeleted value)? structureDeleted,
    TResult Function(_WeekDayTriggered value)? weekDayTriggered,
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
    required TResult Function(int index, String title) stepChanged,
    required TResult Function(int index) stepRemoved,
    required TResult Function() stepAdded,
    required TResult Function(int oldIndex, int newIndex) stepReordered,
    required TResult Function() structureDeleted,
    required TResult Function(int index) weekDayTriggered,
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
    TResult? Function(int index, String title)? stepChanged,
    TResult? Function(int index)? stepRemoved,
    TResult? Function()? stepAdded,
    TResult? Function(int oldIndex, int newIndex)? stepReordered,
    TResult? Function()? structureDeleted,
    TResult? Function(int index)? weekDayTriggered,
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
    TResult Function(int index, String title)? stepChanged,
    TResult Function(int index)? stepRemoved,
    TResult Function()? stepAdded,
    TResult Function(int oldIndex, int newIndex)? stepReordered,
    TResult Function()? structureDeleted,
    TResult Function(int index)? weekDayTriggered,
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
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_StepRemoved value) stepRemoved,
    required TResult Function(_StepAdded value) stepAdded,
    required TResult Function(_StepReordered value) stepReordered,
    required TResult Function(_StructureDeleted value) structureDeleted,
    required TResult Function(_WeekDayTriggered value) weekDayTriggered,
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
    TResult? Function(_StepChanged value)? stepChanged,
    TResult? Function(_StepRemoved value)? stepRemoved,
    TResult? Function(_StepAdded value)? stepAdded,
    TResult? Function(_StepReordered value)? stepReordered,
    TResult? Function(_StructureDeleted value)? structureDeleted,
    TResult? Function(_WeekDayTriggered value)? weekDayTriggered,
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
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_StepRemoved value)? stepRemoved,
    TResult Function(_StepAdded value)? stepAdded,
    TResult Function(_StepReordered value)? stepReordered,
    TResult Function(_StructureDeleted value)? structureDeleted,
    TResult Function(_WeekDayTriggered value)? weekDayTriggered,
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
    required TResult Function(int index, String title) stepChanged,
    required TResult Function(int index) stepRemoved,
    required TResult Function() stepAdded,
    required TResult Function(int oldIndex, int newIndex) stepReordered,
    required TResult Function() structureDeleted,
    required TResult Function(int index) weekDayTriggered,
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
    TResult? Function(int index, String title)? stepChanged,
    TResult? Function(int index)? stepRemoved,
    TResult? Function()? stepAdded,
    TResult? Function(int oldIndex, int newIndex)? stepReordered,
    TResult? Function()? structureDeleted,
    TResult? Function(int index)? weekDayTriggered,
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
    TResult Function(int index, String title)? stepChanged,
    TResult Function(int index)? stepRemoved,
    TResult Function()? stepAdded,
    TResult Function(int oldIndex, int newIndex)? stepReordered,
    TResult Function()? structureDeleted,
    TResult Function(int index)? weekDayTriggered,
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
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_StepRemoved value) stepRemoved,
    required TResult Function(_StepAdded value) stepAdded,
    required TResult Function(_StepReordered value) stepReordered,
    required TResult Function(_StructureDeleted value) structureDeleted,
    required TResult Function(_WeekDayTriggered value) weekDayTriggered,
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
    TResult? Function(_StepChanged value)? stepChanged,
    TResult? Function(_StepRemoved value)? stepRemoved,
    TResult? Function(_StepAdded value)? stepAdded,
    TResult? Function(_StepReordered value)? stepReordered,
    TResult? Function(_StructureDeleted value)? structureDeleted,
    TResult? Function(_WeekDayTriggered value)? weekDayTriggered,
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
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_StepRemoved value)? stepRemoved,
    TResult Function(_StepAdded value)? stepAdded,
    TResult Function(_StepReordered value)? stepReordered,
    TResult Function(_StructureDeleted value)? structureDeleted,
    TResult Function(_WeekDayTriggered value)? weekDayTriggered,
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
    required TResult Function(int index, String title) stepChanged,
    required TResult Function(int index) stepRemoved,
    required TResult Function() stepAdded,
    required TResult Function(int oldIndex, int newIndex) stepReordered,
    required TResult Function() structureDeleted,
    required TResult Function(int index) weekDayTriggered,
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
    TResult? Function(int index, String title)? stepChanged,
    TResult? Function(int index)? stepRemoved,
    TResult? Function()? stepAdded,
    TResult? Function(int oldIndex, int newIndex)? stepReordered,
    TResult? Function()? structureDeleted,
    TResult? Function(int index)? weekDayTriggered,
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
    TResult Function(int index, String title)? stepChanged,
    TResult Function(int index)? stepRemoved,
    TResult Function()? stepAdded,
    TResult Function(int oldIndex, int newIndex)? stepReordered,
    TResult Function()? structureDeleted,
    TResult Function(int index)? weekDayTriggered,
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
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_StepRemoved value) stepRemoved,
    required TResult Function(_StepAdded value) stepAdded,
    required TResult Function(_StepReordered value) stepReordered,
    required TResult Function(_StructureDeleted value) structureDeleted,
    required TResult Function(_WeekDayTriggered value) weekDayTriggered,
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
    TResult? Function(_StepChanged value)? stepChanged,
    TResult? Function(_StepRemoved value)? stepRemoved,
    TResult? Function(_StepAdded value)? stepAdded,
    TResult? Function(_StepReordered value)? stepReordered,
    TResult? Function(_StructureDeleted value)? structureDeleted,
    TResult? Function(_WeekDayTriggered value)? weekDayTriggered,
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
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_StepRemoved value)? stepRemoved,
    TResult Function(_StepAdded value)? stepAdded,
    TResult Function(_StepReordered value)? stepReordered,
    TResult Function(_StructureDeleted value)? structureDeleted,
    TResult Function(_WeekDayTriggered value)? weekDayTriggered,
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
    required TResult Function(int index, String title) stepChanged,
    required TResult Function(int index) stepRemoved,
    required TResult Function() stepAdded,
    required TResult Function(int oldIndex, int newIndex) stepReordered,
    required TResult Function() structureDeleted,
    required TResult Function(int index) weekDayTriggered,
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
    TResult? Function(int index, String title)? stepChanged,
    TResult? Function(int index)? stepRemoved,
    TResult? Function()? stepAdded,
    TResult? Function(int oldIndex, int newIndex)? stepReordered,
    TResult? Function()? structureDeleted,
    TResult? Function(int index)? weekDayTriggered,
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
    TResult Function(int index, String title)? stepChanged,
    TResult Function(int index)? stepRemoved,
    TResult Function()? stepAdded,
    TResult Function(int oldIndex, int newIndex)? stepReordered,
    TResult Function()? structureDeleted,
    TResult Function(int index)? weekDayTriggered,
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
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_StepRemoved value) stepRemoved,
    required TResult Function(_StepAdded value) stepAdded,
    required TResult Function(_StepReordered value) stepReordered,
    required TResult Function(_StructureDeleted value) structureDeleted,
    required TResult Function(_WeekDayTriggered value) weekDayTriggered,
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
    TResult? Function(_StepChanged value)? stepChanged,
    TResult? Function(_StepRemoved value)? stepRemoved,
    TResult? Function(_StepAdded value)? stepAdded,
    TResult? Function(_StepReordered value)? stepReordered,
    TResult? Function(_StructureDeleted value)? structureDeleted,
    TResult? Function(_WeekDayTriggered value)? weekDayTriggered,
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
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_StepRemoved value)? stepRemoved,
    TResult Function(_StepAdded value)? stepAdded,
    TResult Function(_StepReordered value)? stepReordered,
    TResult Function(_StructureDeleted value)? structureDeleted,
    TResult Function(_WeekDayTriggered value)? weekDayTriggered,
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
    required TResult Function(int index, String title) stepChanged,
    required TResult Function(int index) stepRemoved,
    required TResult Function() stepAdded,
    required TResult Function(int oldIndex, int newIndex) stepReordered,
    required TResult Function() structureDeleted,
    required TResult Function(int index) weekDayTriggered,
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
    TResult? Function(int index, String title)? stepChanged,
    TResult? Function(int index)? stepRemoved,
    TResult? Function()? stepAdded,
    TResult? Function(int oldIndex, int newIndex)? stepReordered,
    TResult? Function()? structureDeleted,
    TResult? Function(int index)? weekDayTriggered,
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
    TResult Function(int index, String title)? stepChanged,
    TResult Function(int index)? stepRemoved,
    TResult Function()? stepAdded,
    TResult Function(int oldIndex, int newIndex)? stepReordered,
    TResult Function()? structureDeleted,
    TResult Function(int index)? weekDayTriggered,
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
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_StepRemoved value) stepRemoved,
    required TResult Function(_StepAdded value) stepAdded,
    required TResult Function(_StepReordered value) stepReordered,
    required TResult Function(_StructureDeleted value) structureDeleted,
    required TResult Function(_WeekDayTriggered value) weekDayTriggered,
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
    TResult? Function(_StepChanged value)? stepChanged,
    TResult? Function(_StepRemoved value)? stepRemoved,
    TResult? Function(_StepAdded value)? stepAdded,
    TResult? Function(_StepReordered value)? stepReordered,
    TResult? Function(_StructureDeleted value)? structureDeleted,
    TResult? Function(_WeekDayTriggered value)? weekDayTriggered,
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
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_StepRemoved value)? stepRemoved,
    TResult Function(_StepAdded value)? stepAdded,
    TResult Function(_StepReordered value)? stepReordered,
    TResult Function(_StructureDeleted value)? structureDeleted,
    TResult Function(_WeekDayTriggered value)? weekDayTriggered,
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
abstract class _$$StepChangedImplCopyWith<$Res> {
  factory _$$StepChangedImplCopyWith(
          _$StepChangedImpl value, $Res Function(_$StepChangedImpl) then) =
      __$$StepChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, String title});
}

/// @nodoc
class __$$StepChangedImplCopyWithImpl<$Res>
    extends _$EditStructureEventCopyWithImpl<$Res, _$StepChangedImpl>
    implements _$$StepChangedImplCopyWith<$Res> {
  __$$StepChangedImplCopyWithImpl(
      _$StepChangedImpl _value, $Res Function(_$StepChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? title = null,
  }) {
    return _then(_$StepChangedImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StepChangedImpl implements _StepChanged {
  const _$StepChangedImpl(this.index, this.title);

  @override
  final int index;
  @override
  final String title;

  @override
  String toString() {
    return 'EditStructureEvent.stepChanged(index: $index, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepChangedImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, title);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StepChangedImplCopyWith<_$StepChangedImpl> get copyWith =>
      __$$StepChangedImplCopyWithImpl<_$StepChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function() nextStep,
    required TResult Function(int index, String title) stepChanged,
    required TResult Function(int index) stepRemoved,
    required TResult Function() stepAdded,
    required TResult Function(int oldIndex, int newIndex) stepReordered,
    required TResult Function() structureDeleted,
    required TResult Function(int index) weekDayTriggered,
  }) {
    return stepChanged(index, title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? submitted,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function(Color color)? colorChanged,
    TResult? Function()? nextStep,
    TResult? Function(int index, String title)? stepChanged,
    TResult? Function(int index)? stepRemoved,
    TResult? Function()? stepAdded,
    TResult? Function(int oldIndex, int newIndex)? stepReordered,
    TResult? Function()? structureDeleted,
    TResult? Function(int index)? weekDayTriggered,
  }) {
    return stepChanged?.call(index, title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function()? nextStep,
    TResult Function(int index, String title)? stepChanged,
    TResult Function(int index)? stepRemoved,
    TResult Function()? stepAdded,
    TResult Function(int oldIndex, int newIndex)? stepReordered,
    TResult Function()? structureDeleted,
    TResult Function(int index)? weekDayTriggered,
    required TResult orElse(),
  }) {
    if (stepChanged != null) {
      return stepChanged(index, title);
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
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_StepRemoved value) stepRemoved,
    required TResult Function(_StepAdded value) stepAdded,
    required TResult Function(_StepReordered value) stepReordered,
    required TResult Function(_StructureDeleted value) structureDeleted,
    required TResult Function(_WeekDayTriggered value) weekDayTriggered,
  }) {
    return stepChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_DescriptionChanged value)? descriptionChanged,
    TResult? Function(_ColorChanged value)? colorChanged,
    TResult? Function(_NextStep value)? nextStep,
    TResult? Function(_StepChanged value)? stepChanged,
    TResult? Function(_StepRemoved value)? stepRemoved,
    TResult? Function(_StepAdded value)? stepAdded,
    TResult? Function(_StepReordered value)? stepReordered,
    TResult? Function(_StructureDeleted value)? structureDeleted,
    TResult? Function(_WeekDayTriggered value)? weekDayTriggered,
  }) {
    return stepChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_DescriptionChanged value)? descriptionChanged,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_NextStep value)? nextStep,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_StepRemoved value)? stepRemoved,
    TResult Function(_StepAdded value)? stepAdded,
    TResult Function(_StepReordered value)? stepReordered,
    TResult Function(_StructureDeleted value)? structureDeleted,
    TResult Function(_WeekDayTriggered value)? weekDayTriggered,
    required TResult orElse(),
  }) {
    if (stepChanged != null) {
      return stepChanged(this);
    }
    return orElse();
  }
}

abstract class _StepChanged implements EditStructureEvent {
  const factory _StepChanged(final int index, final String title) =
      _$StepChangedImpl;

  int get index;
  String get title;

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StepChangedImplCopyWith<_$StepChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StepRemovedImplCopyWith<$Res> {
  factory _$$StepRemovedImplCopyWith(
          _$StepRemovedImpl value, $Res Function(_$StepRemovedImpl) then) =
      __$$StepRemovedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$StepRemovedImplCopyWithImpl<$Res>
    extends _$EditStructureEventCopyWithImpl<$Res, _$StepRemovedImpl>
    implements _$$StepRemovedImplCopyWith<$Res> {
  __$$StepRemovedImplCopyWithImpl(
      _$StepRemovedImpl _value, $Res Function(_$StepRemovedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$StepRemovedImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StepRemovedImpl implements _StepRemoved {
  const _$StepRemovedImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'EditStructureEvent.stepRemoved(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepRemovedImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StepRemovedImplCopyWith<_$StepRemovedImpl> get copyWith =>
      __$$StepRemovedImplCopyWithImpl<_$StepRemovedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function() nextStep,
    required TResult Function(int index, String title) stepChanged,
    required TResult Function(int index) stepRemoved,
    required TResult Function() stepAdded,
    required TResult Function(int oldIndex, int newIndex) stepReordered,
    required TResult Function() structureDeleted,
    required TResult Function(int index) weekDayTriggered,
  }) {
    return stepRemoved(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? submitted,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function(Color color)? colorChanged,
    TResult? Function()? nextStep,
    TResult? Function(int index, String title)? stepChanged,
    TResult? Function(int index)? stepRemoved,
    TResult? Function()? stepAdded,
    TResult? Function(int oldIndex, int newIndex)? stepReordered,
    TResult? Function()? structureDeleted,
    TResult? Function(int index)? weekDayTriggered,
  }) {
    return stepRemoved?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function()? nextStep,
    TResult Function(int index, String title)? stepChanged,
    TResult Function(int index)? stepRemoved,
    TResult Function()? stepAdded,
    TResult Function(int oldIndex, int newIndex)? stepReordered,
    TResult Function()? structureDeleted,
    TResult Function(int index)? weekDayTriggered,
    required TResult orElse(),
  }) {
    if (stepRemoved != null) {
      return stepRemoved(index);
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
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_StepRemoved value) stepRemoved,
    required TResult Function(_StepAdded value) stepAdded,
    required TResult Function(_StepReordered value) stepReordered,
    required TResult Function(_StructureDeleted value) structureDeleted,
    required TResult Function(_WeekDayTriggered value) weekDayTriggered,
  }) {
    return stepRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_DescriptionChanged value)? descriptionChanged,
    TResult? Function(_ColorChanged value)? colorChanged,
    TResult? Function(_NextStep value)? nextStep,
    TResult? Function(_StepChanged value)? stepChanged,
    TResult? Function(_StepRemoved value)? stepRemoved,
    TResult? Function(_StepAdded value)? stepAdded,
    TResult? Function(_StepReordered value)? stepReordered,
    TResult? Function(_StructureDeleted value)? structureDeleted,
    TResult? Function(_WeekDayTriggered value)? weekDayTriggered,
  }) {
    return stepRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_DescriptionChanged value)? descriptionChanged,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_NextStep value)? nextStep,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_StepRemoved value)? stepRemoved,
    TResult Function(_StepAdded value)? stepAdded,
    TResult Function(_StepReordered value)? stepReordered,
    TResult Function(_StructureDeleted value)? structureDeleted,
    TResult Function(_WeekDayTriggered value)? weekDayTriggered,
    required TResult orElse(),
  }) {
    if (stepRemoved != null) {
      return stepRemoved(this);
    }
    return orElse();
  }
}

abstract class _StepRemoved implements EditStructureEvent {
  const factory _StepRemoved(final int index) = _$StepRemovedImpl;

  int get index;

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StepRemovedImplCopyWith<_$StepRemovedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StepAddedImplCopyWith<$Res> {
  factory _$$StepAddedImplCopyWith(
          _$StepAddedImpl value, $Res Function(_$StepAddedImpl) then) =
      __$$StepAddedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StepAddedImplCopyWithImpl<$Res>
    extends _$EditStructureEventCopyWithImpl<$Res, _$StepAddedImpl>
    implements _$$StepAddedImplCopyWith<$Res> {
  __$$StepAddedImplCopyWithImpl(
      _$StepAddedImpl _value, $Res Function(_$StepAddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StepAddedImpl implements _StepAdded {
  const _$StepAddedImpl();

  @override
  String toString() {
    return 'EditStructureEvent.stepAdded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StepAddedImpl);
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
    required TResult Function(int index, String title) stepChanged,
    required TResult Function(int index) stepRemoved,
    required TResult Function() stepAdded,
    required TResult Function(int oldIndex, int newIndex) stepReordered,
    required TResult Function() structureDeleted,
    required TResult Function(int index) weekDayTriggered,
  }) {
    return stepAdded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? submitted,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function(Color color)? colorChanged,
    TResult? Function()? nextStep,
    TResult? Function(int index, String title)? stepChanged,
    TResult? Function(int index)? stepRemoved,
    TResult? Function()? stepAdded,
    TResult? Function(int oldIndex, int newIndex)? stepReordered,
    TResult? Function()? structureDeleted,
    TResult? Function(int index)? weekDayTriggered,
  }) {
    return stepAdded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function()? nextStep,
    TResult Function(int index, String title)? stepChanged,
    TResult Function(int index)? stepRemoved,
    TResult Function()? stepAdded,
    TResult Function(int oldIndex, int newIndex)? stepReordered,
    TResult Function()? structureDeleted,
    TResult Function(int index)? weekDayTriggered,
    required TResult orElse(),
  }) {
    if (stepAdded != null) {
      return stepAdded();
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
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_StepRemoved value) stepRemoved,
    required TResult Function(_StepAdded value) stepAdded,
    required TResult Function(_StepReordered value) stepReordered,
    required TResult Function(_StructureDeleted value) structureDeleted,
    required TResult Function(_WeekDayTriggered value) weekDayTriggered,
  }) {
    return stepAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_DescriptionChanged value)? descriptionChanged,
    TResult? Function(_ColorChanged value)? colorChanged,
    TResult? Function(_NextStep value)? nextStep,
    TResult? Function(_StepChanged value)? stepChanged,
    TResult? Function(_StepRemoved value)? stepRemoved,
    TResult? Function(_StepAdded value)? stepAdded,
    TResult? Function(_StepReordered value)? stepReordered,
    TResult? Function(_StructureDeleted value)? structureDeleted,
    TResult? Function(_WeekDayTriggered value)? weekDayTriggered,
  }) {
    return stepAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_DescriptionChanged value)? descriptionChanged,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_NextStep value)? nextStep,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_StepRemoved value)? stepRemoved,
    TResult Function(_StepAdded value)? stepAdded,
    TResult Function(_StepReordered value)? stepReordered,
    TResult Function(_StructureDeleted value)? structureDeleted,
    TResult Function(_WeekDayTriggered value)? weekDayTriggered,
    required TResult orElse(),
  }) {
    if (stepAdded != null) {
      return stepAdded(this);
    }
    return orElse();
  }
}

abstract class _StepAdded implements EditStructureEvent {
  const factory _StepAdded() = _$StepAddedImpl;
}

/// @nodoc
abstract class _$$StepReorderedImplCopyWith<$Res> {
  factory _$$StepReorderedImplCopyWith(
          _$StepReorderedImpl value, $Res Function(_$StepReorderedImpl) then) =
      __$$StepReorderedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int oldIndex, int newIndex});
}

/// @nodoc
class __$$StepReorderedImplCopyWithImpl<$Res>
    extends _$EditStructureEventCopyWithImpl<$Res, _$StepReorderedImpl>
    implements _$$StepReorderedImplCopyWith<$Res> {
  __$$StepReorderedImplCopyWithImpl(
      _$StepReorderedImpl _value, $Res Function(_$StepReorderedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldIndex = null,
    Object? newIndex = null,
  }) {
    return _then(_$StepReorderedImpl(
      null == oldIndex
          ? _value.oldIndex
          : oldIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == newIndex
          ? _value.newIndex
          : newIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StepReorderedImpl implements _StepReordered {
  const _$StepReorderedImpl(this.oldIndex, this.newIndex);

  @override
  final int oldIndex;
  @override
  final int newIndex;

  @override
  String toString() {
    return 'EditStructureEvent.stepReordered(oldIndex: $oldIndex, newIndex: $newIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepReorderedImpl &&
            (identical(other.oldIndex, oldIndex) ||
                other.oldIndex == oldIndex) &&
            (identical(other.newIndex, newIndex) ||
                other.newIndex == newIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldIndex, newIndex);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StepReorderedImplCopyWith<_$StepReorderedImpl> get copyWith =>
      __$$StepReorderedImplCopyWithImpl<_$StepReorderedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function() nextStep,
    required TResult Function(int index, String title) stepChanged,
    required TResult Function(int index) stepRemoved,
    required TResult Function() stepAdded,
    required TResult Function(int oldIndex, int newIndex) stepReordered,
    required TResult Function() structureDeleted,
    required TResult Function(int index) weekDayTriggered,
  }) {
    return stepReordered(oldIndex, newIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? submitted,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function(Color color)? colorChanged,
    TResult? Function()? nextStep,
    TResult? Function(int index, String title)? stepChanged,
    TResult? Function(int index)? stepRemoved,
    TResult? Function()? stepAdded,
    TResult? Function(int oldIndex, int newIndex)? stepReordered,
    TResult? Function()? structureDeleted,
    TResult? Function(int index)? weekDayTriggered,
  }) {
    return stepReordered?.call(oldIndex, newIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function()? nextStep,
    TResult Function(int index, String title)? stepChanged,
    TResult Function(int index)? stepRemoved,
    TResult Function()? stepAdded,
    TResult Function(int oldIndex, int newIndex)? stepReordered,
    TResult Function()? structureDeleted,
    TResult Function(int index)? weekDayTriggered,
    required TResult orElse(),
  }) {
    if (stepReordered != null) {
      return stepReordered(oldIndex, newIndex);
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
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_StepRemoved value) stepRemoved,
    required TResult Function(_StepAdded value) stepAdded,
    required TResult Function(_StepReordered value) stepReordered,
    required TResult Function(_StructureDeleted value) structureDeleted,
    required TResult Function(_WeekDayTriggered value) weekDayTriggered,
  }) {
    return stepReordered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_DescriptionChanged value)? descriptionChanged,
    TResult? Function(_ColorChanged value)? colorChanged,
    TResult? Function(_NextStep value)? nextStep,
    TResult? Function(_StepChanged value)? stepChanged,
    TResult? Function(_StepRemoved value)? stepRemoved,
    TResult? Function(_StepAdded value)? stepAdded,
    TResult? Function(_StepReordered value)? stepReordered,
    TResult? Function(_StructureDeleted value)? structureDeleted,
    TResult? Function(_WeekDayTriggered value)? weekDayTriggered,
  }) {
    return stepReordered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_DescriptionChanged value)? descriptionChanged,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_NextStep value)? nextStep,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_StepRemoved value)? stepRemoved,
    TResult Function(_StepAdded value)? stepAdded,
    TResult Function(_StepReordered value)? stepReordered,
    TResult Function(_StructureDeleted value)? structureDeleted,
    TResult Function(_WeekDayTriggered value)? weekDayTriggered,
    required TResult orElse(),
  }) {
    if (stepReordered != null) {
      return stepReordered(this);
    }
    return orElse();
  }
}

abstract class _StepReordered implements EditStructureEvent {
  const factory _StepReordered(final int oldIndex, final int newIndex) =
      _$StepReorderedImpl;

  int get oldIndex;
  int get newIndex;

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StepReorderedImplCopyWith<_$StepReorderedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StructureDeletedImplCopyWith<$Res> {
  factory _$$StructureDeletedImplCopyWith(_$StructureDeletedImpl value,
          $Res Function(_$StructureDeletedImpl) then) =
      __$$StructureDeletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StructureDeletedImplCopyWithImpl<$Res>
    extends _$EditStructureEventCopyWithImpl<$Res, _$StructureDeletedImpl>
    implements _$$StructureDeletedImplCopyWith<$Res> {
  __$$StructureDeletedImplCopyWithImpl(_$StructureDeletedImpl _value,
      $Res Function(_$StructureDeletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StructureDeletedImpl implements _StructureDeleted {
  const _$StructureDeletedImpl();

  @override
  String toString() {
    return 'EditStructureEvent.structureDeleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StructureDeletedImpl);
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
    required TResult Function(int index, String title) stepChanged,
    required TResult Function(int index) stepRemoved,
    required TResult Function() stepAdded,
    required TResult Function(int oldIndex, int newIndex) stepReordered,
    required TResult Function() structureDeleted,
    required TResult Function(int index) weekDayTriggered,
  }) {
    return structureDeleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? submitted,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function(Color color)? colorChanged,
    TResult? Function()? nextStep,
    TResult? Function(int index, String title)? stepChanged,
    TResult? Function(int index)? stepRemoved,
    TResult? Function()? stepAdded,
    TResult? Function(int oldIndex, int newIndex)? stepReordered,
    TResult? Function()? structureDeleted,
    TResult? Function(int index)? weekDayTriggered,
  }) {
    return structureDeleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function()? nextStep,
    TResult Function(int index, String title)? stepChanged,
    TResult Function(int index)? stepRemoved,
    TResult Function()? stepAdded,
    TResult Function(int oldIndex, int newIndex)? stepReordered,
    TResult Function()? structureDeleted,
    TResult Function(int index)? weekDayTriggered,
    required TResult orElse(),
  }) {
    if (structureDeleted != null) {
      return structureDeleted();
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
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_StepRemoved value) stepRemoved,
    required TResult Function(_StepAdded value) stepAdded,
    required TResult Function(_StepReordered value) stepReordered,
    required TResult Function(_StructureDeleted value) structureDeleted,
    required TResult Function(_WeekDayTriggered value) weekDayTriggered,
  }) {
    return structureDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_DescriptionChanged value)? descriptionChanged,
    TResult? Function(_ColorChanged value)? colorChanged,
    TResult? Function(_NextStep value)? nextStep,
    TResult? Function(_StepChanged value)? stepChanged,
    TResult? Function(_StepRemoved value)? stepRemoved,
    TResult? Function(_StepAdded value)? stepAdded,
    TResult? Function(_StepReordered value)? stepReordered,
    TResult? Function(_StructureDeleted value)? structureDeleted,
    TResult? Function(_WeekDayTriggered value)? weekDayTriggered,
  }) {
    return structureDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_DescriptionChanged value)? descriptionChanged,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_NextStep value)? nextStep,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_StepRemoved value)? stepRemoved,
    TResult Function(_StepAdded value)? stepAdded,
    TResult Function(_StepReordered value)? stepReordered,
    TResult Function(_StructureDeleted value)? structureDeleted,
    TResult Function(_WeekDayTriggered value)? weekDayTriggered,
    required TResult orElse(),
  }) {
    if (structureDeleted != null) {
      return structureDeleted(this);
    }
    return orElse();
  }
}

abstract class _StructureDeleted implements EditStructureEvent {
  const factory _StructureDeleted() = _$StructureDeletedImpl;
}

/// @nodoc
abstract class _$$WeekDayTriggeredImplCopyWith<$Res> {
  factory _$$WeekDayTriggeredImplCopyWith(_$WeekDayTriggeredImpl value,
          $Res Function(_$WeekDayTriggeredImpl) then) =
      __$$WeekDayTriggeredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$WeekDayTriggeredImplCopyWithImpl<$Res>
    extends _$EditStructureEventCopyWithImpl<$Res, _$WeekDayTriggeredImpl>
    implements _$$WeekDayTriggeredImplCopyWith<$Res> {
  __$$WeekDayTriggeredImplCopyWithImpl(_$WeekDayTriggeredImpl _value,
      $Res Function(_$WeekDayTriggeredImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$WeekDayTriggeredImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WeekDayTriggeredImpl implements _WeekDayTriggered {
  const _$WeekDayTriggeredImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'EditStructureEvent.weekDayTriggered(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekDayTriggeredImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekDayTriggeredImplCopyWith<_$WeekDayTriggeredImpl> get copyWith =>
      __$$WeekDayTriggeredImplCopyWithImpl<_$WeekDayTriggeredImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() submitted,
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function() nextStep,
    required TResult Function(int index, String title) stepChanged,
    required TResult Function(int index) stepRemoved,
    required TResult Function() stepAdded,
    required TResult Function(int oldIndex, int newIndex) stepReordered,
    required TResult Function() structureDeleted,
    required TResult Function(int index) weekDayTriggered,
  }) {
    return weekDayTriggered(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? submitted,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function(Color color)? colorChanged,
    TResult? Function()? nextStep,
    TResult? Function(int index, String title)? stepChanged,
    TResult? Function(int index)? stepRemoved,
    TResult? Function()? stepAdded,
    TResult? Function(int oldIndex, int newIndex)? stepReordered,
    TResult? Function()? structureDeleted,
    TResult? Function(int index)? weekDayTriggered,
  }) {
    return weekDayTriggered?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? submitted,
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function()? nextStep,
    TResult Function(int index, String title)? stepChanged,
    TResult Function(int index)? stepRemoved,
    TResult Function()? stepAdded,
    TResult Function(int oldIndex, int newIndex)? stepReordered,
    TResult Function()? structureDeleted,
    TResult Function(int index)? weekDayTriggered,
    required TResult orElse(),
  }) {
    if (weekDayTriggered != null) {
      return weekDayTriggered(index);
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
    required TResult Function(_StepChanged value) stepChanged,
    required TResult Function(_StepRemoved value) stepRemoved,
    required TResult Function(_StepAdded value) stepAdded,
    required TResult Function(_StepReordered value) stepReordered,
    required TResult Function(_StructureDeleted value) structureDeleted,
    required TResult Function(_WeekDayTriggered value) weekDayTriggered,
  }) {
    return weekDayTriggered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_DescriptionChanged value)? descriptionChanged,
    TResult? Function(_ColorChanged value)? colorChanged,
    TResult? Function(_NextStep value)? nextStep,
    TResult? Function(_StepChanged value)? stepChanged,
    TResult? Function(_StepRemoved value)? stepRemoved,
    TResult? Function(_StepAdded value)? stepAdded,
    TResult? Function(_StepReordered value)? stepReordered,
    TResult? Function(_StructureDeleted value)? structureDeleted,
    TResult? Function(_WeekDayTriggered value)? weekDayTriggered,
  }) {
    return weekDayTriggered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Submitted value)? submitted,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_DescriptionChanged value)? descriptionChanged,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_NextStep value)? nextStep,
    TResult Function(_StepChanged value)? stepChanged,
    TResult Function(_StepRemoved value)? stepRemoved,
    TResult Function(_StepAdded value)? stepAdded,
    TResult Function(_StepReordered value)? stepReordered,
    TResult Function(_StructureDeleted value)? structureDeleted,
    TResult Function(_WeekDayTriggered value)? weekDayTriggered,
    required TResult orElse(),
  }) {
    if (weekDayTriggered != null) {
      return weekDayTriggered(this);
    }
    return orElse();
  }
}

abstract class _WeekDayTriggered implements EditStructureEvent {
  const factory _WeekDayTriggered(final int index) = _$WeekDayTriggeredImpl;

  int get index;

  /// Create a copy of EditStructureEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekDayTriggeredImplCopyWith<_$WeekDayTriggeredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EditStructureState {
  String get structureId => throw _privateConstructorUsedError;
  EditStructureStatus get editStatus => throw _privateConstructorUsedError;
  StepsGenerationStatus get stepsGenerationStatus =>
      throw _privateConstructorUsedError;
  StructureDeletionStatus get deletionStatus =>
      throw _privateConstructorUsedError;
  String get languageCode => throw _privateConstructorUsedError;
  Structure? get initialStructure => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<StructureStep> get steps => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  List<bool> get weekDays => throw _privateConstructorUsedError;

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
      {String structureId,
      EditStructureStatus editStatus,
      StepsGenerationStatus stepsGenerationStatus,
      StructureDeletionStatus deletionStatus,
      String languageCode,
      Structure? initialStructure,
      String title,
      String description,
      List<StructureStep> steps,
      Color color,
      List<bool> weekDays});

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
    Object? structureId = null,
    Object? editStatus = null,
    Object? stepsGenerationStatus = null,
    Object? deletionStatus = null,
    Object? languageCode = null,
    Object? initialStructure = freezed,
    Object? title = null,
    Object? description = null,
    Object? steps = null,
    Object? color = null,
    Object? weekDays = null,
  }) {
    return _then(_value.copyWith(
      structureId: null == structureId
          ? _value.structureId
          : structureId // ignore: cast_nullable_to_non_nullable
              as String,
      editStatus: null == editStatus
          ? _value.editStatus
          : editStatus // ignore: cast_nullable_to_non_nullable
              as EditStructureStatus,
      stepsGenerationStatus: null == stepsGenerationStatus
          ? _value.stepsGenerationStatus
          : stepsGenerationStatus // ignore: cast_nullable_to_non_nullable
              as StepsGenerationStatus,
      deletionStatus: null == deletionStatus
          ? _value.deletionStatus
          : deletionStatus // ignore: cast_nullable_to_non_nullable
              as StructureDeletionStatus,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
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
      weekDays: null == weekDays
          ? _value.weekDays
          : weekDays // ignore: cast_nullable_to_non_nullable
              as List<bool>,
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
      {String structureId,
      EditStructureStatus editStatus,
      StepsGenerationStatus stepsGenerationStatus,
      StructureDeletionStatus deletionStatus,
      String languageCode,
      Structure? initialStructure,
      String title,
      String description,
      List<StructureStep> steps,
      Color color,
      List<bool> weekDays});

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
    Object? structureId = null,
    Object? editStatus = null,
    Object? stepsGenerationStatus = null,
    Object? deletionStatus = null,
    Object? languageCode = null,
    Object? initialStructure = freezed,
    Object? title = null,
    Object? description = null,
    Object? steps = null,
    Object? color = null,
    Object? weekDays = null,
  }) {
    return _then(_$EditStructureStateImpl(
      structureId: null == structureId
          ? _value.structureId
          : structureId // ignore: cast_nullable_to_non_nullable
              as String,
      editStatus: null == editStatus
          ? _value.editStatus
          : editStatus // ignore: cast_nullable_to_non_nullable
              as EditStructureStatus,
      stepsGenerationStatus: null == stepsGenerationStatus
          ? _value.stepsGenerationStatus
          : stepsGenerationStatus // ignore: cast_nullable_to_non_nullable
              as StepsGenerationStatus,
      deletionStatus: null == deletionStatus
          ? _value.deletionStatus
          : deletionStatus // ignore: cast_nullable_to_non_nullable
              as StructureDeletionStatus,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
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
      weekDays: null == weekDays
          ? _value._weekDays
          : weekDays // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc

class _$EditStructureStateImpl implements _EditStructureState {
  const _$EditStructureStateImpl(
      {required this.structureId,
      this.editStatus = EditStructureStatus.initial,
      this.stepsGenerationStatus = StepsGenerationStatus.initial,
      this.deletionStatus = StructureDeletionStatus.initial,
      this.languageCode = 'en',
      this.initialStructure,
      this.title = '',
      this.description = '',
      final List<StructureStep> steps = const [],
      this.color = Colors.deepPurple,
      final List<bool> weekDays = const [
        true,
        true,
        true,
        true,
        true,
        false,
        false
      ]})
      : _steps = steps,
        _weekDays = weekDays;

  @override
  final String structureId;
  @override
  @JsonKey()
  final EditStructureStatus editStatus;
  @override
  @JsonKey()
  final StepsGenerationStatus stepsGenerationStatus;
  @override
  @JsonKey()
  final StructureDeletionStatus deletionStatus;
  @override
  @JsonKey()
  final String languageCode;
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
  final List<bool> _weekDays;
  @override
  @JsonKey()
  List<bool> get weekDays {
    if (_weekDays is EqualUnmodifiableListView) return _weekDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekDays);
  }

  @override
  String toString() {
    return 'EditStructureState(structureId: $structureId, editStatus: $editStatus, stepsGenerationStatus: $stepsGenerationStatus, deletionStatus: $deletionStatus, languageCode: $languageCode, initialStructure: $initialStructure, title: $title, description: $description, steps: $steps, color: $color, weekDays: $weekDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditStructureStateImpl &&
            (identical(other.structureId, structureId) ||
                other.structureId == structureId) &&
            (identical(other.editStatus, editStatus) ||
                other.editStatus == editStatus) &&
            (identical(other.stepsGenerationStatus, stepsGenerationStatus) ||
                other.stepsGenerationStatus == stepsGenerationStatus) &&
            (identical(other.deletionStatus, deletionStatus) ||
                other.deletionStatus == deletionStatus) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.initialStructure, initialStructure) ||
                other.initialStructure == initialStructure) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality().equals(other._weekDays, _weekDays));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      structureId,
      editStatus,
      stepsGenerationStatus,
      deletionStatus,
      languageCode,
      initialStructure,
      title,
      description,
      const DeepCollectionEquality().hash(_steps),
      color,
      const DeepCollectionEquality().hash(_weekDays));

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
      {required final String structureId,
      final EditStructureStatus editStatus,
      final StepsGenerationStatus stepsGenerationStatus,
      final StructureDeletionStatus deletionStatus,
      final String languageCode,
      final Structure? initialStructure,
      final String title,
      final String description,
      final List<StructureStep> steps,
      final Color color,
      final List<bool> weekDays}) = _$EditStructureStateImpl;

  @override
  String get structureId;
  @override
  EditStructureStatus get editStatus;
  @override
  StepsGenerationStatus get stepsGenerationStatus;
  @override
  StructureDeletionStatus get deletionStatus;
  @override
  String get languageCode;
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
  @override
  List<bool> get weekDays;

  /// Create a copy of EditStructureState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditStructureStateImplCopyWith<_$EditStructureStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
