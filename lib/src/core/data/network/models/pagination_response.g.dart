// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponseDto<T> _$PaginationResponseDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationResponseDto<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      meta: MetaDto.fromJson(json['meta'] as Map<String, dynamic>),
    );

MetaDto _$MetaDtoFromJson(Map<String, dynamic> json) => MetaDto(
      pagination:
          PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
    );

PaginationDto _$PaginationDtoFromJson(Map<String, dynamic> json) =>
    PaginationDto(
      total: json['total'] as int,
      count: json['count'] as int,
      perPage: json['per_page'] as int,
      currentPage: json['current_page'] as int,
      totalPages: json['total_pages'] as int,
    );
