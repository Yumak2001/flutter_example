// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDto _$EventDtoFromJson(Map<String, dynamic> json) => EventDto(
      id: json['id'],
      attributes: EventAttributesDto.fromJson(
          json['attributes'] as Map<String, dynamic>),
      relationships: EventRelationshipsDto.fromJson(
          json['relationships'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventDtoToJson(EventDto instance) => <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
      'relationships': instance.relationships,
    };

EventAttributesDto _$EventAttributesDtoFromJson(Map<String, dynamic> json) =>
    EventAttributesDto(
      title: json['title'] as String,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      event_start_time: json['event-start-time'] as String,
      event_finish_time: json['event-finish-time'] as String,
      image_url: json['image-url'] as String?,
    );

Map<String, dynamic> _$EventAttributesDtoToJson(EventAttributesDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'event-start-time': instance.event_start_time,
      'event-finish-time': instance.event_finish_time,
      'image-url': instance.image_url,
    };

EventRelationshipsDto _$EventRelationshipsDtoFromJson(
        Map<String, dynamic> json) =>
    EventRelationshipsDto(
      topic: EventRelationshipsDataDto.fromJson(
          json['topic'] as Map<String, dynamic>),
      speakers: EventSpeakersDataDto.fromJson(
          json['speakers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventRelationshipsDtoToJson(
        EventRelationshipsDto instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'speakers': instance.speakers,
    };

EventRelationshipsDataDto _$EventRelationshipsDataDtoFromJson(
        Map<String, dynamic> json) =>
    EventRelationshipsDataDto(
      id: json['id'] as String,
    );

Map<String, dynamic> _$EventRelationshipsDataDtoToJson(
        EventRelationshipsDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

EventSpeakersDataDto _$EventSpeakersDataDtoFromJson(
        Map<String, dynamic> json) =>
    EventSpeakersDataDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => EventSpeakerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventSpeakersDataDtoToJson(
        EventSpeakersDataDto instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

EventSpeakerDto _$EventSpeakerDtoFromJson(Map<String, dynamic> json) =>
    EventSpeakerDto(
      id: json['id'],
    );

Map<String, dynamic> _$EventSpeakerDtoToJson(EventSpeakerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

PaginationEventDto _$PaginationEventDtoFromJson(Map<String, dynamic> json) =>
    PaginationEventDto(
      total: json['total'] as int,
      count: json['count'] as int,
      per_page: json['per_page'] as int,
      current_page: json['current_page'] as int,
      total_pages: json['total_pages'] as int,
    );

Map<String, dynamic> _$PaginationEventDtoToJson(PaginationEventDto instance) =>
    <String, dynamic>{
      'total': instance.total,
      'count': instance.count,
      'per_page': instance.per_page,
      'current_page': instance.current_page,
      'total_pages': instance.total_pages,
    };
