import 'package:faneron_mobile/src/core/domain/entities/news_detailed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_detailed.g.dart';

@JsonSerializable(createToJson: false)
class NewsDetailedDto {
  final int id;
  final String title;
  @JsonKey(name: "title-en")
  final String? titleEn;
  final String slug;
  final String description;
  @JsonKey(name: "description-en")
  final String? descriptionEn;
  final String? teaser;
  @JsonKey(name: "teaser-en")
  final String? teaserEn;
  @JsonKey(name: "image-url")
  final String? imageUrl;
  final bool published;
  @JsonKey(name: "created-at")
  final DateTime createdAt;
  @JsonKey(name: "updated-at")
  final DateTime updatedAt;

  NewsDetailedDto({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.slug,
    required this.description,
    required this.descriptionEn,
    required this.teaser,
    required this.teaserEn,
    required this.imageUrl,
    required this.published,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NewsDetailedDto.fromJson(Map<String, dynamic> json) => _$NewsDetailedDtoFromJson(json);

  NewsDetailed toEntity() => NewsDetailed(
        id: id,
        title: title,
        description: description,
        createdAt: createdAt,
        updatedAt: updatedAt,
        slug: slug,
      );
}
