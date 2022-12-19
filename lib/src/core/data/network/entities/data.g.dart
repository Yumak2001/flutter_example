// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponseDto _$DataResponseDtoFromJson(Map<String, dynamic> json) =>
    DataResponseDto(
      type: json['type'] as String,
      id: json['id'],
      attributes: json['attributes'] as Map<String, dynamic>,
      relationships: json['relationships'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$DataResponseDtoToJson(DataResponseDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'attributes': instance.attributes,
      'relationships': instance.relationships,
    };
