// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'structure_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StructureStep _$StructureStepFromJson(Map<String, dynamic> json) {
  return _StructureStep.fromJson(json);
}

/// @nodoc
mixin _$StructureStep {
  String get id => throw _privateConstructorUsedError;
  String get structureId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this StructureStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StructureStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StructureStepCopyWith<StructureStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StructureStepCopyWith<$Res> {
  factory $StructureStepCopyWith(
          StructureStep value, $Res Function(StructureStep) then) =
      _$StructureStepCopyWithImpl<$Res, StructureStep>;
  @useResult
  $Res call({String id, String structureId, String title});
}

/// @nodoc
class _$StructureStepCopyWithImpl<$Res, $Val extends StructureStep>
    implements $StructureStepCopyWith<$Res> {
  _$StructureStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StructureStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? structureId = null,
    Object? title = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StructureStepImplCopyWith<$Res>
    implements $StructureStepCopyWith<$Res> {
  factory _$$StructureStepImplCopyWith(
          _$StructureStepImpl value, $Res Function(_$StructureStepImpl) then) =
      __$$StructureStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String structureId, String title});
}

/// @nodoc
class __$$StructureStepImplCopyWithImpl<$Res>
    extends _$StructureStepCopyWithImpl<$Res, _$StructureStepImpl>
    implements _$$StructureStepImplCopyWith<$Res> {
  __$$StructureStepImplCopyWithImpl(
      _$StructureStepImpl _value, $Res Function(_$StructureStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of StructureStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? structureId = null,
    Object? title = null,
  }) {
    return _then(_$StructureStepImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      structureId: null == structureId
          ? _value.structureId
          : structureId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StructureStepImpl implements _StructureStep {
  _$StructureStepImpl(
      {required this.id, required this.structureId, required this.title});

  factory _$StructureStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$StructureStepImplFromJson(json);

  @override
  final String id;
  @override
  final String structureId;
  @override
  final String title;

  @override
  String toString() {
    return 'StructureStep(id: $id, structureId: $structureId, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StructureStepImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.structureId, structureId) ||
                other.structureId == structureId) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, structureId, title);

  /// Create a copy of StructureStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StructureStepImplCopyWith<_$StructureStepImpl> get copyWith =>
      __$$StructureStepImplCopyWithImpl<_$StructureStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StructureStepImplToJson(
      this,
    );
  }
}

abstract class _StructureStep implements StructureStep {
  factory _StructureStep(
      {required final String id,
      required final String structureId,
      required final String title}) = _$StructureStepImpl;

  factory _StructureStep.fromJson(Map<String, dynamic> json) =
      _$StructureStepImpl.fromJson;

  @override
  String get id;
  @override
  String get structureId;
  @override
  String get title;

  /// Create a copy of StructureStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StructureStepImplCopyWith<_$StructureStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
