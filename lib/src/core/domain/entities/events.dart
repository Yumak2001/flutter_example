class EventsDataDomain {
  final List<EventDomain> events;
  final List<TopicDomain> topics;

  EventsDataDomain({
    this.events = const [],
    this.topics = const [],
  });

  EventsDataDomain copyWith({
    List<EventDomain>? events,
    List<TopicDomain>? topics,
  }) =>
      EventsDataDomain(
        events: events ?? this.events,
        topics: topics ?? this.topics,
      );
}

class EventDomain {
  final String id;
  final String title;
  final String? slug;
  final String? description;
  final DateTime startEvent;
  final DateTime finishEvent;
  final String topicId;
  final String imageUrl;
  final List<SpeakerDomain> speakers;

  EventDomain({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.startEvent,
    required this.finishEvent,
    required this.topicId,
    required this.imageUrl,
    required this.speakers,
  });
}

class TopicDomain {
  final String id;
  final String title;

  TopicDomain({
    required this.id,
    required this.title,
  });
}

class SpeakerDomain {
  final String id;

  SpeakerDomain({
    required this.id,
  });
}
