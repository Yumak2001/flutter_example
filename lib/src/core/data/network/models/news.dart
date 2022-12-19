import 'package:faneron_mobile/src/core/domain/entities/news.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable(createToJson: false)
class NewsDto {
  final dynamic id;
  final NewsAttributesDto attributes;

  NewsDto({
    required this.id,
    required this.attributes,
  });

  factory NewsDto.fromJson(Map<String, dynamic> json) => _$NewsDtoFromJson(json);

  News toNews() => News(
        id: id is String ? id : id.toString(),
        title: attributes.title,
        description: attributes.description,
        imageUrl: "https://faneron.ru" + attributes.imageUrl,
        published: attributes.published,
        createdAt: attributes.createdAt,
        updatedAt: attributes.updatedAt,
      );
}

@JsonSerializable(createToJson: false)
class NewsAttributesDto {
  final String title;
  @JsonKey(name: "title-en")
  final String? titleEn;
  final String description;
  @JsonKey(name: "description-en")
  final String? descriptionEn;
  final String slug;
  final String? teaser;
  @JsonKey(name: "teaser-en")
  final String? teaserEn;
  @JsonKey(name: "image-url")
  final String imageUrl;
  final bool published;
  @JsonKey(name: "created-at")
  final DateTime createdAt;
  @JsonKey(name: "updated-at")
  final DateTime? updatedAt;

  NewsAttributesDto({
    required this.title,
    required this.titleEn,
    required this.description,
    required this.descriptionEn,
    required this.slug,
    required this.teaser,
    required this.teaserEn,
    required this.imageUrl,
    required this.published,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NewsAttributesDto.fromJson(Map<String, dynamic> json) => _$NewsAttributesDtoFromJson(json);
}
