import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/data/storage/events.dart';
import 'package:json_annotation/json_annotation.dart';

part 'events.g.dart';

class EventsDataDto {
  final List<EventDto> data;
  final List<IncludedEventDto> included;
  final PaginationEventDto meta;

  EventsDataDto({
    required this.data,
    required this.included,
    required this.meta,
  });

  factory EventsDataDto.fromJson(
    Map<String, dynamic> json,
  ) {
    List<EventDto> data = [];
    try {
      if (json['data'].isNotEmpty) {
        json['data'].forEach((element) {
          data.add(EventDto.fromJson(Map<String, dynamic>.from(element)));
        });
      }
    } catch (e) {
      Log.error(e.toString());
    }
    List<IncludedEventDto> included = [];
    try {
      if (json['included'].isNotEmpty) {
        json['included'].forEach((element) {
          var data = IncludedEventDto.fromJson(Map<String, dynamic>.from(element));
          if (data.type == 'topics') included.add(data);
        });
      }
    } catch (e) {
      Log.error(e.toString());
    }
    return EventsDataDto(
      data: data,
      included: included,
      meta: PaginationEventDto.fromJson(json['meta']['pagination']),
    );
  }
}

@JsonSerializable()
class EventDto {
  final dynamic id;
  final EventAttributesDto attributes;
  final EventRelationshipsDto relationships;

  EventDto({
    required this.id,
    required this.attributes,
    required this.relationships,
  });

  EventStorage get toStorage => EventStorage(
        id: id.toString(),
        slug: attributes.slug,
        title: attributes.title,
        description: attributes.description,
        startEvent: DateTime.parse(attributes.event_start_time),
        finishEvent: DateTime.parse(attributes.event_finish_time),
        topicId: relationships.topic.id,
        speakers: relationships.speakers.data.map((e) => e.toStorage).toList(),
        imageUrl: attributes.image_url != null ? ('https://faneron.ru' + attributes.image_url!) : null,
      );

  factory EventDto.fromJson(Map<String, dynamic> json) => _$EventDtoFromJson(Map<String, dynamic>.from(json));
}

@JsonSerializable()
class EventAttributesDto {
  final String title;
  final String? slug;
  final String? description;
  @JsonKey(name: 'event-start-time')
  final String event_start_time;
  @JsonKey(name: 'event-finish-time')
  final String event_finish_time;
  @JsonKey(name: 'image-url')
  final String? image_url;

  EventAttributesDto({
    required this.title,
    required this.slug,
    required this.description,
    required this.event_start_time,
    required this.event_finish_time,
    required this.image_url,
  });

  factory EventAttributesDto.fromJson(Map<String, dynamic> json) =>
      _$EventAttributesDtoFromJson(Map<String, dynamic>.from(json));
}

@JsonSerializable()
class EventRelationshipsDto {
  final EventRelationshipsDataDto topic;
  final EventSpeakersDataDto speakers;

  EventRelationshipsDto({
    required this.topic,
    required this.speakers,
  });
  factory EventRelationshipsDto.fromJson(Map<String, dynamic> json) =>
      _$EventRelationshipsDtoFromJson(Map<String, dynamic>.from(json));
}

@JsonSerializable()
class EventRelationshipsDataDto {
  final String id;
  EventRelationshipsDataDto({
    required this.id,
  });

  factory EventRelationshipsDataDto.fromJson(Map<String, dynamic> json) =>
      _$EventRelationshipsDataDtoFromJson(Map<String, dynamic>.from(json['data']));
}

@JsonSerializable()
class EventSpeakersDataDto {
  final List<EventSpeakerDto> data;
  EventSpeakersDataDto({
    required this.data,
  });

  factory EventSpeakersDataDto.fromJson(Map<String, dynamic> json) => _$EventSpeakersDataDtoFromJson(json);
}

@JsonSerializable()
class EventSpeakerDto {
  final dynamic id;
  EventSpeakerDto({
    required this.id,
  });

  factory EventSpeakerDto.fromJson(Map<String, dynamic> json) =>
      _$EventSpeakerDtoFromJson(Map<String, dynamic>.from(json['data']));

  SpeakerStorage get toStorage => SpeakerStorage(id: id.toString());
}

class IncludedEventDto {
  final String type;
  final String id;
  final String title;

  IncludedEventDto({
    required this.type,
    required this.id,
    required this.title,
  });

  TopicStorage get toStorage => TopicStorage(
        id: id,
        title: title,
      );

  factory IncludedEventDto.fromJson(Map<String, dynamic> json) {
    return IncludedEventDto(
      type: json['type'],
      id: json['id'],
      title: json['attributes']['title'],
    );
  }
}

@JsonSerializable()
class PaginationEventDto {
  final int total;
  final int count;
  final int per_page;
  final int current_page;
  final int total_pages;

  PaginationEventDto({
    required this.total,
    required this.count,
    required this.per_page,
    required this.current_page,
    required this.total_pages,
  });

  factory PaginationEventDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationEventDtoFromJson(Map<String, dynamic>.from(json));
}
