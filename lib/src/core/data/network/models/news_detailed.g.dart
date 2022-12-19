// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detailed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailedDto _$NewsDetailedDtoFromJson(Map<String, dynamic> json) =>
    NewsDetailedDto(
      id: json['id'] as int,
      title: json['title'] as String,
      titleEn: json['title-en'] as String?,
      slug: json['slug'] as String,
      description: json['description'] as String,
      descriptionEn: json['description-en'] as String?,
      teaser: json['teaser'] as String?,
      teaserEn: json['teaser-en'] as String?,
      imageUrl: json['image-url'] as String?,
      published: json['published'] as bool,
      createdAt: DateTime.parse(json['created-at'] as String),
      updatedAt: DateTime.parse(json['updated-at'] as String),
    );
