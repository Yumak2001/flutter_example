// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'included.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncludedDto _$IncludedDtoFromJson(Map<String, dynamic> json) => IncludedDto(
      type: json['type'] as String,
      id: json['id'],
      attributes: json['attributes'] as Map<String, dynamic>,
      relationships: json['relationships'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$IncludedDtoToJson(IncludedDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'attributes': instance.attributes,
      'relationships': instance.relationships,
    };
