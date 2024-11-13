// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'structure_of_a_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StructureOfADay _$StructureOfADayFromJson(Map<String, dynamic> json) {
  return _StructureOfADay.fromJson(json);
}

/// @nodoc
mixin _$StructureOfADay {
  String get id => throw _privateConstructorUsedError;
  String get structureId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<String> get stepsIds => throw _privateConstructorUsedError;
  List<String> get completedStepsIds => throw _privateConstructorUsedError;

  /// Serializes this StructureOfADay to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StructureOfADay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StructureOfADayCopyWith<StructureOfADay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StructureOfADayCopyWith<$Res> {
  factory $StructureOfADayCopyWith(
          StructureOfADay value, $Res Function(StructureOfADay) then) =
      _$StructureOfADayCopyWithImpl<$Res, StructureOfADay>;
  @useResult
  $Res call(
      {String id,
      String structureId,
      DateTime date,
      List<String> stepsIds,
      List<String> completedStepsIds});
}

/// @nodoc
class _$StructureOfADayCopyWithImpl<$Res, $Val extends StructureOfADay>
    implements $StructureOfADayCopyWith<$Res> {
  _$StructureOfADayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StructureOfADay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? structureId = null,
    Object? date = null,
    Object? stepsIds = null,
    Object? completedStepsIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      structureId: null == structureId
          ? _value.structureId
          : structureId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stepsIds: null == stepsIds
          ? _value.stepsIds
          : stepsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completedStepsIds: null == completedStepsIds
          ? _value.completedStepsIds
          : completedStepsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StructureOfADayImplCopyWith<$Res>
    implements $StructureOfADayCopyWith<$Res> {
  factory _$$StructureOfADayImplCopyWith(_$StructureOfADayImpl value,
          $Res Function(_$StructureOfADayImpl) then) =
      __$$StructureOfADayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String structureId,
      DateTime date,
      List<String> stepsIds,
      List<String> completedStepsIds});
}

/// @nodoc
class __$$StructureOfADayImplCopyWithImpl<$Res>
    extends _$StructureOfADayCopyWithImpl<$Res, _$StructureOfADayImpl>
    implements _$$StructureOfADayImplCopyWith<$Res> {
  __$$StructureOfADayImplCopyWithImpl(
      _$StructureOfADayImpl _value, $Res Function(_$StructureOfADayImpl) _then)
      : super(_value, _then);

  /// Create a copy of StructureOfADay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? structureId = null,
    Object? date = null,
    Object? stepsIds = null,
    Object? completedStepsIds = null,
  }) {
    return _then(_$StructureOfADayImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      structureId: null == structureId
          ? _value.structureId
          : structureId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stepsIds: null == stepsIds
          ? _value._stepsIds
          : stepsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completedStepsIds: null == completedStepsIds
          ? _value._completedStepsIds
          : completedStepsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StructureOfADayImpl extends _StructureOfADay {
  _$StructureOfADayImpl(
      {required this.id,
      required this.structureId,
      required this.date,
      required final List<String> stepsIds,
      required final List<String> completedStepsIds})
      : _stepsIds = stepsIds,
        _completedStepsIds = completedStepsIds,
        super._();

  factory _$StructureOfADayImpl.fromJson(Map<String, dynamic> json) =>
      _$$StructureOfADayImplFromJson(json);

  @override
  final String id;
  @override
  final String structureId;
  @override
  final DateTime date;
  final List<String> _stepsIds;
  @override
  List<String> get stepsIds {
    if (_stepsIds is EqualUnmodifiableListView) return _stepsIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stepsIds);
  }

  final List<String> _completedStepsIds;
  @override
  List<String> get completedStepsIds {
    if (_completedStepsIds is EqualUnmodifiableListView)
      return _completedStepsIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedStepsIds);
  }

  @override
  String toString() {
    return 'StructureOfADay(id: $id, structureId: $structureId, date: $date, stepsIds: $stepsIds, completedStepsIds: $completedStepsIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StructureOfADayImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.structureId, structureId) ||
                other.structureId == structureId) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._stepsIds, _stepsIds) &&
            const DeepCollectionEquality()
                .equals(other._completedStepsIds, _completedStepsIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      structureId,
      date,
      const DeepCollectionEquality().hash(_stepsIds),
      const DeepCollectionEquality().hash(_completedStepsIds));

  /// Create a copy of StructureOfADay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StructureOfADayImplCopyWith<_$StructureOfADayImpl> get copyWith =>
      __$$StructureOfADayImplCopyWithImpl<_$StructureOfADayImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StructureOfADayImplToJson(
      this,
    );
  }
}

abstract class _StructureOfADay extends StructureOfADay {
  factory _StructureOfADay(
      {required final String id,
      required final String structureId,
      required final DateTime date,
      required final List<String> stepsIds,
      required final List<String> completedStepsIds}) = _$StructureOfADayImpl;
  _StructureOfADay._() : super._();

  factory _StructureOfADay.fromJson(Map<String, dynamic> json) =
      _$StructureOfADayImpl.fromJson;

  @override
  String get id;
  @override
  String get structureId;
  @override
  DateTime get date;
  @override
  List<String> get stepsIds;
  @override
  List<String> get completedStepsIds;

  /// Create a copy of StructureOfADay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StructureOfADayImplCopyWith<_$StructureOfADayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
