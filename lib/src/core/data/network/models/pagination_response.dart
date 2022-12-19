import 'package:faneron_mobile/src/core/domain/entities/news.dart';
import 'package:faneron_mobile/src/core/domain/entities/pagination_container.dart';
import 'package:json_annotation/json_annotation.dart';

import 'news.dart';

part 'pagination_response.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class PaginationResponseDto<T> {
  final List<T> data;
  final MetaDto meta;

  PaginationResponseDto({
    required this.data,
    required this.meta,
  });

  int get currentPage => meta.pagination.currentPage;

  int get totalPages => meta.pagination.totalPages;

  factory PaginationResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PaginationResponseDtoFromJson<T>(json, fromJsonT);

  PaginationContainer<T2> toPaginationContainer<T2>() => PaginationContainer(
        data: data.map((e) => mapper<T2>(e)).toList(),
        pagination: meta.pagination.toPagination(),
      );

  T2 mapper<T2>(T e) {
    switch (T2) {
      case News:
        return (e as NewsDto).toNews() as T2;
      default:
        throw UnimplementedError();
    }
  }
}

@JsonSerializable(createToJson: false)
class MetaDto {
  final PaginationDto pagination;

  MetaDto({
    required this.pagination,
  });

  factory MetaDto.fromJson(Map<String, dynamic> json) => _$MetaDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class PaginationDto {
  final int total;
  final int count;
  @JsonKey(name: "per_page")
  final int perPage;
  @JsonKey(name: "current_page")
  final int currentPage;
  @JsonKey(name: "total_pages")
  final int totalPages;

  PaginationDto({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
  });

  factory PaginationDto.fromJson(Map<String, dynamic> json) => _$PaginationDtoFromJson(json);

  Pagination toPagination() => Pagination(
        currentPage: currentPage,
        totalPages: totalPages,
      );
}
