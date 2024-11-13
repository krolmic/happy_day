// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StructureImpl _$$StructureImplFromJson(Map<String, dynamic> json) =>
    _$StructureImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      stepsIds: (json['stepsIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String?,
      color: (json['color'] as num?)?.toInt() ?? 0xff3f51b5,
    );

Map<String, dynamic> _$$StructureImplToJson(_$StructureImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'stepsIds': instance.stepsIds,
      'description': instance.description,
      'color': instance.color,
    };
