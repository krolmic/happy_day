// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'structure_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StructureDetailsState {
  Structure get structure => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  StructureOfADay? get structureOfADay => throw _privateConstructorUsedError;
  int get activeStepIndex => throw _privateConstructorUsedError;
  StartStructureStatus get startStructureStatus =>
      throw _privateConstructorUsedError;
  StepCompletionStatus get stepCompletionStatus =>
      throw _privateConstructorUsedError;
  List<StructureStep> get steps => throw _privateConstructorUsedError;

  /// Create a copy of StructureDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StructureDetailsStateCopyWith<StructureDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StructureDetailsStateCopyWith<$Res> {
  factory $StructureDetailsStateCopyWith(StructureDetailsState value,
          $Res Function(StructureDetailsState) then) =
      _$StructureDetailsStateCopyWithImpl<$Res, StructureDetailsState>;
  @useResult
  $Res call(
      {Structure structure,
      DateTime date,
      StructureOfADay? structureOfADay,
      int activeStepIndex,
      StartStructureStatus startStructureStatus,
      StepCompletionStatus stepCompletionStatus,
      List<StructureStep> steps});

  $StructureCopyWith<$Res> get structure;
  $StructureOfADayCopyWith<$Res>? get structureOfADay;
}

/// @nodoc
class _$StructureDetailsStateCopyWithImpl<$Res,
        $Val extends StructureDetailsState>
    implements $StructureDetailsStateCopyWith<$Res> {
  _$StructureDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StructureDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? structure = null,
    Object? date = null,
    Object? structureOfADay = freezed,
    Object? activeStepIndex = null,
    Object? startStructureStatus = null,
    Object? stepCompletionStatus = null,
    Object? steps = null,
  }) {
    return _then(_value.copyWith(
      structure: null == structure
          ? _value.structure
          : structure // ignore: cast_nullable_to_non_nullable
              as Structure,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      structureOfADay: freezed == structureOfADay
          ? _value.structureOfADay
          : structureOfADay // ignore: cast_nullable_to_non_nullable
              as StructureOfADay?,
      activeStepIndex: null == activeStepIndex
          ? _value.activeStepIndex
          : activeStepIndex // ignore: cast_nullable_to_non_nullable
              as int,
      startStructureStatus: null == startStructureStatus
          ? _value.startStructureStatus
          : startStructureStatus // ignore: cast_nullable_to_non_nullable
              as StartStructureStatus,
      stepCompletionStatus: null == stepCompletionStatus
          ? _value.stepCompletionStatus
          : stepCompletionStatus // ignore: cast_nullable_to_non_nullable
              as StepCompletionStatus,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StructureStep>,
    ) as $Val);
  }

  /// Create a copy of StructureDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructureCopyWith<$Res> get structure {
    return $StructureCopyWith<$Res>(_value.structure, (value) {
      return _then(_value.copyWith(structure: value) as $Val);
    });
  }

  /// Create a copy of StructureDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructureOfADayCopyWith<$Res>? get structureOfADay {
    if (_value.structureOfADay == null) {
      return null;
    }

    return $StructureOfADayCopyWith<$Res>(_value.structureOfADay!, (value) {
      return _then(_value.copyWith(structureOfADay: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StructureDetailsStateImplCopyWith<$Res>
    implements $StructureDetailsStateCopyWith<$Res> {
  factory _$$StructureDetailsStateImplCopyWith(
          _$StructureDetailsStateImpl value,
          $Res Function(_$StructureDetailsStateImpl) then) =
      __$$StructureDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Structure structure,
      DateTime date,
      StructureOfADay? structureOfADay,
      int activeStepIndex,
      StartStructureStatus startStructureStatus,
      StepCompletionStatus stepCompletionStatus,
      List<StructureStep> steps});

  @override
  $StructureCopyWith<$Res> get structure;
  @override
  $StructureOfADayCopyWith<$Res>? get structureOfADay;
}

/// @nodoc
class __$$StructureDetailsStateImplCopyWithImpl<$Res>
    extends _$StructureDetailsStateCopyWithImpl<$Res,
        _$StructureDetailsStateImpl>
    implements _$$StructureDetailsStateImplCopyWith<$Res> {
  __$$StructureDetailsStateImplCopyWithImpl(_$StructureDetailsStateImpl _value,
      $Res Function(_$StructureDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StructureDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? structure = null,
    Object? date = null,
    Object? structureOfADay = freezed,
    Object? activeStepIndex = null,
    Object? startStructureStatus = null,
    Object? stepCompletionStatus = null,
    Object? steps = null,
  }) {
    return _then(_$StructureDetailsStateImpl(
      structure: null == structure
          ? _value.structure
          : structure // ignore: cast_nullable_to_non_nullable
              as Structure,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      structureOfADay: freezed == structureOfADay
          ? _value.structureOfADay
          : structureOfADay // ignore: cast_nullable_to_non_nullable
              as StructureOfADay?,
      activeStepIndex: null == activeStepIndex
          ? _value.activeStepIndex
          : activeStepIndex // ignore: cast_nullable_to_non_nullable
              as int,
      startStructureStatus: null == startStructureStatus
          ? _value.startStructureStatus
          : startStructureStatus // ignore: cast_nullable_to_non_nullable
              as StartStructureStatus,
      stepCompletionStatus: null == stepCompletionStatus
          ? _value.stepCompletionStatus
          : stepCompletionStatus // ignore: cast_nullable_to_non_nullable
              as StepCompletionStatus,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StructureStep>,
    ));
  }
}

/// @nodoc

class _$StructureDetailsStateImpl implements _StructureDetailsState {
  _$StructureDetailsStateImpl(
      {required this.structure,
      required this.date,
      this.structureOfADay,
      this.activeStepIndex = 0,
      this.startStructureStatus = StartStructureStatus.initial,
      this.stepCompletionStatus = StepCompletionStatus.initial,
      final List<StructureStep> steps = const []})
      : _steps = steps;

  @override
  final Structure structure;
  @override
  final DateTime date;
  @override
  final StructureOfADay? structureOfADay;
  @override
  @JsonKey()
  final int activeStepIndex;
  @override
  @JsonKey()
  final StartStructureStatus startStructureStatus;
  @override
  @JsonKey()
  final StepCompletionStatus stepCompletionStatus;
  final List<StructureStep> _steps;
  @override
  @JsonKey()
  List<StructureStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  String toString() {
    return 'StructureDetailsState(structure: $structure, date: $date, structureOfADay: $structureOfADay, activeStepIndex: $activeStepIndex, startStructureStatus: $startStructureStatus, stepCompletionStatus: $stepCompletionStatus, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StructureDetailsStateImpl &&
            (identical(other.structure, structure) ||
                other.structure == structure) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.structureOfADay, structureOfADay) ||
                other.structureOfADay == structureOfADay) &&
            (identical(other.activeStepIndex, activeStepIndex) ||
                other.activeStepIndex == activeStepIndex) &&
            (identical(other.startStructureStatus, startStructureStatus) ||
                other.startStructureStatus == startStructureStatus) &&
            (identical(other.stepCompletionStatus, stepCompletionStatus) ||
                other.stepCompletionStatus == stepCompletionStatus) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      structure,
      date,
      structureOfADay,
      activeStepIndex,
      startStructureStatus,
      stepCompletionStatus,
      const DeepCollectionEquality().hash(_steps));

  /// Create a copy of StructureDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StructureDetailsStateImplCopyWith<_$StructureDetailsStateImpl>
      get copyWith => __$$StructureDetailsStateImplCopyWithImpl<
          _$StructureDetailsStateImpl>(this, _$identity);
}

abstract class _StructureDetailsState implements StructureDetailsState {
  factory _StructureDetailsState(
      {required final Structure structure,
      required final DateTime date,
      final StructureOfADay? structureOfADay,
      final int activeStepIndex,
      final StartStructureStatus startStructureStatus,
      final StepCompletionStatus stepCompletionStatus,
      final List<StructureStep> steps}) = _$StructureDetailsStateImpl;

  @override
  Structure get structure;
  @override
  DateTime get date;
  @override
  StructureOfADay? get structureOfADay;
  @override
  int get activeStepIndex;
  @override
  StartStructureStatus get startStructureStatus;
  @override
  StepCompletionStatus get stepCompletionStatus;
  @override
  List<StructureStep> get steps;

  /// Create a copy of StructureDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StructureDetailsStateImplCopyWith<_$StructureDetailsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
