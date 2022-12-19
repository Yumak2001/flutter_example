// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      included: (json['included'] as List<dynamic>)
          .map((e) => IncludedDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'included': instance.included,
    };
