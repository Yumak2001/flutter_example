import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/data/storage/events.dart';
import 'package:json_annotation/json_annotation.dart';

part 'included.g.dart';

@JsonSerializable()
class IncludedDto {
  final String type;
  final dynamic id;
  final Map attributes;
  final Map? relationships;

  IncludedDto({
    required this.type,
    required this.id,
    required this.attributes,
    required this.relationships,
  });

  factory IncludedDto.fromJson(Map<String, dynamic> json) => _$IncludedDtoFromJson(json);

  EventStorage? get toEvent {
    if (type == 'event') {
      return EventStorage(
        id: id.toString(),
        slug: Map<String, dynamic>.from(attributes)['slug'] as String,
        title: Map<String, dynamic>.from(attributes)['title'] as String,
        description: '',
        startEvent: DateTime.parse(Map<String, dynamic>.from(attributes)['event-start-time'] as String),
        finishEvent: DateTime.parse(Map<String, dynamic>.from(attributes)['event-finish-time'] as String),
        topicId: Map<String, dynamic>.from(relationships!)['topic']['data']['id'] as String,
        imageUrl: null,
        speakers: const [],
      );
    }
    return null;
  }
}
