// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDto _$NewsDtoFromJson(Map<String, dynamic> json) => NewsDto(
      id: json['id'],
      attributes: NewsAttributesDto.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

NewsAttributesDto _$NewsAttributesDtoFromJson(Map<String, dynamic> json) =>
    NewsAttributesDto(
      title: json['title'] as String,
      titleEn: json['title-en'] as String?,
      description: json['description'] as String,
      descriptionEn: json['description-en'] as String?,
      slug: json['slug'] as String,
      teaser: json['teaser'] as String?,
      teaserEn: json['teaser-en'] as String?,
      imageUrl: json['image-url'] as String,
      published: json['published'] as bool,
      createdAt: DateTime.parse(json['created-at'] as String),
      updatedAt: json['updated-at'] == null
          ? null
          : DateTime.parse(json['updated-at'] as String),
    );
