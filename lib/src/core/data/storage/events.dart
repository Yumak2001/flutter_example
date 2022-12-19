import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'events.g.dart';

abstract class EventsDataStorage {
  late List<EventStorage> eventList;
  late List<TopicStorage> topicList;
  late List<String> eventsPayIdList;
  late List<EventStorage> eventTicketsList;
  Stream<List<EventDomain>> get watchEvents;
  Stream<List<TopicDomain>> get watchTopics;
  Stream<List<String>> get watchEventsPayId;
  void addEventPayId(String id);
  void setEventTickets(EventStorage event);
  void addTopic(TopicStorage topic);
}

@Injectable(as: EventsDataStorage)
class EventsDataStorageHive implements EventsDataStorage {
  static const _hiveBoxName = 'events';

  ///Box
  Box get _hiveBox => Hive.box(_hiveBoxName);

  static Future init() async {
    await Hive.openBox(_hiveBoxName);
  }

  EventsDataStorageHive() {
    _hiveBox.watch().listen((event) {
      if (event.key == _Keys.events.name) {
        _watchEventsController.add((event.value as List<EventStorage>).map((e) => e.toDomain).toList());
      }
      if (event.key == _Keys.topics.name) {
        _watchTopicsController.add((event.value as List<TopicStorage>).map((e) => e.toDomain).toList());
      }
      if (event.key == _Keys.eventsPayId.name) {
        _watchEventsPayIdController.add(event.value as List<String>);
      }
      _watchEventsController.add(eventList.map((e) => e.toDomain).toList());
      _watchTopicsController.add(topicList.map((e) => e.toDomain).toList());
      _watchEventsPayIdController.add(eventsPayIdList);
    });
  }

  ///Streams
  final _watchEventsController = BehaviorSubject<List<EventDomain>>();
  final _watchTopicsController = BehaviorSubject<List<TopicDomain>>();
  final _watchEventsPayIdController = BehaviorSubject<List<String>>();

  @override
  Stream<List<EventDomain>> get watchEvents => _watchEventsController.stream;
  @override
  Stream<List<TopicDomain>> get watchTopics => _watchTopicsController.stream;
  @override
  Stream<List<String>> get watchEventsPayId => _watchEventsPayIdController.stream;

  ///Getter
  List<EventStorage> get eventList {
    var events = _hiveBox.get(_Keys.events.name);
    return events != null ? List<EventStorage>.from(events).toList() : List<EventStorage>.empty();
  }

  List<TopicStorage> get topicList {
    var topics = _hiveBox.get(_Keys.topics.name);
    return topics != null ? List<TopicStorage>.from(topics).toList() : List<TopicStorage>.empty();
  }

  List<String> get eventsPayIdList {
    var topics = _hiveBox.get(_Keys.eventsPayId.name);
    return topics != null ? List<String>.from(topics).toList() : List<String>.empty();
  }

  List<EventStorage> get eventTicketsList {
    var topics = _hiveBox.get(_Keys.eventTickets.name);
    return topics != null ? List<EventStorage>.from(topics).toList() : List<EventStorage>.empty();
  }

  ///Setter
  set eventList(List<EventStorage> value) {
    _hiveBox.put(_Keys.events.name, value);
  }

  set topicList(List<TopicStorage> value) {
    _hiveBox.put(_Keys.topics.name, value);
  }

  set eventsPayIdList(List<String> value) {
    _hiveBox.put(_Keys.eventsPayId.name, value);
  }

  set eventTicketsList(List<EventStorage> value) {
    _hiveBox.put(_Keys.eventTickets.name, value);
  }

  @override
  void addEventPayId(String id) {
    var ids = eventsPayIdList.toList();
    if (ids.indexWhere((element) => element == id) == -1) {
      ids.add(id);
    }
    eventsPayIdList = ids;
  }

  @override
  void setEventTickets(EventStorage event) {
    var list = eventTicketsList.toList();
    list.removeWhere((element) => element.id == event.id);
    list.add(event);
    eventTicketsList = list;
  }

  @override
  void addTopic(TopicStorage topic) {
    var list = topicList.toList();
    list.removeWhere((element) => element.title == topic.title);
    list.add(topic);
    topicList = list;
  }
}

enum _Keys {
  events,
  topics,
  eventsPayId,
  eventTickets,
}

@HiveType(typeId: 1)
class EventStorage {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String? slug;
  @HiveField(3)
  String? description;
  @HiveField(4)
  DateTime startEvent;
  @HiveField(5)
  DateTime finishEvent;
  @HiveField(6)
  String topicId;
  @HiveField(7)
  List<SpeakerStorage>? speakers;
  @HiveField(8)
  String? imageUrl;

  EventStorage({
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

  EventDomain get toDomain => EventDomain(
        id: id,
        slug: slug,
        title: title,
        description: description,
        startEvent: startEvent,
        finishEvent: finishEvent,
        topicId: topicId,
        imageUrl: imageUrl ?? '',
        speakers: speakers?.map((e) => e.toDomain).toList() ?? [],
      );
}

@HiveType(typeId: 2)
class TopicStorage {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;

  TopicStorage({
    required this.id,
    required this.title,
  });

  TopicDomain get toDomain => TopicDomain(
        id: id,
        title: title,
      );
}

@HiveType(typeId: 3)
class SpeakerStorage {
  @HiveField(0)
  String id;

  SpeakerStorage({
    required this.id,
  });

  SpeakerDomain get toDomain => SpeakerDomain(
        id: id,
      );
}
