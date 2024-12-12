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
      colorRed: (json['colorRed'] as num?)?.toInt() ?? 103,
      colorGreen: (json['colorGreen'] as num?)?.toInt() ?? 58,
      colorBlue: (json['colorBlue'] as num?)?.toInt() ?? 183,
    );

Map<String, dynamic> _$$StructureImplToJson(_$StructureImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'stepsIds': instance.stepsIds,
      'description': instance.description,
      'colorRed': instance.colorRed,
      'colorGreen': instance.colorGreen,
      'colorBlue': instance.colorBlue,
    };
