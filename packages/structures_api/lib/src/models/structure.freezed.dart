// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'structure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Structure _$StructureFromJson(Map<String, dynamic> json) {
  return _Structure.fromJson(json);
}

/// @nodoc
mixin _$Structure {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get stepsIds => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;

  /// Serializes this Structure to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Structure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StructureCopyWith<Structure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StructureCopyWith<$Res> {
  factory $StructureCopyWith(Structure value, $Res Function(Structure) then) =
      _$StructureCopyWithImpl<$Res, Structure>;
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> stepsIds,
      String? description,
      int color});
}

/// @nodoc
class _$StructureCopyWithImpl<$Res, $Val extends Structure>
    implements $StructureCopyWith<$Res> {
  _$StructureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Structure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? stepsIds = null,
    Object? description = freezed,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      stepsIds: null == stepsIds
          ? _value.stepsIds
          : stepsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StructureImplCopyWith<$Res>
    implements $StructureCopyWith<$Res> {
  factory _$$StructureImplCopyWith(
          _$StructureImpl value, $Res Function(_$StructureImpl) then) =
      __$$StructureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> stepsIds,
      String? description,
      int color});
}

/// @nodoc
class __$$StructureImplCopyWithImpl<$Res>
    extends _$StructureCopyWithImpl<$Res, _$StructureImpl>
    implements _$$StructureImplCopyWith<$Res> {
  __$$StructureImplCopyWithImpl(
      _$StructureImpl _value, $Res Function(_$StructureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Structure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? stepsIds = null,
    Object? description = freezed,
    Object? color = null,
  }) {
    return _then(_$StructureImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      stepsIds: null == stepsIds
          ? _value._stepsIds
          : stepsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StructureImpl extends _Structure {
  _$StructureImpl(
      {required this.id,
      required this.title,
      final List<String> stepsIds = const [],
      this.description,
      this.color = 0xff3f51b5})
      : _stepsIds = stepsIds,
        super._();

  factory _$StructureImpl.fromJson(Map<String, dynamic> json) =>
      _$$StructureImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<String> _stepsIds;
  @override
  @JsonKey()
  List<String> get stepsIds {
    if (_stepsIds is EqualUnmodifiableListView) return _stepsIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stepsIds);
  }

  @override
  final String? description;
  @override
  @JsonKey()
  final int color;

  @override
  String toString() {
    return 'Structure(id: $id, title: $title, stepsIds: $stepsIds, description: $description, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StructureImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._stepsIds, _stepsIds) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title,
      const DeepCollectionEquality().hash(_stepsIds), description, color);

  /// Create a copy of Structure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StructureImplCopyWith<_$StructureImpl> get copyWith =>
      __$$StructureImplCopyWithImpl<_$StructureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StructureImplToJson(
      this,
    );
  }
}

abstract class _Structure extends Structure {
  factory _Structure(
      {required final String id,
      required final String title,
      final List<String> stepsIds,
      final String? description,
      final int color}) = _$StructureImpl;
  _Structure._() : super._();

  factory _Structure.fromJson(Map<String, dynamic> json) =
      _$StructureImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<String> get stepsIds;
  @override
  String? get description;
  @override
  int get color;

  /// Create a copy of Structure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StructureImplCopyWith<_$StructureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}