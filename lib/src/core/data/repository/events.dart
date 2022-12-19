import 'package:faneron_mobile/src/core/data/network/service/events.dart';
import 'package:faneron_mobile/src/core/data/storage/events.dart';
import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:faneron_mobile/src/core/domain/repository/events.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: EventsRepository)
class EventsRepositoryImpl implements EventsRepository {
  final EventsService _eventsService;
  final EventsDataStorage _eventsDataStorage;

  EventsDataDomain eventData = EventsDataDomain();

  EventsRepositoryImpl(
    this._eventsService,
    this._eventsDataStorage,
  ) {
    getAllEvents();
    _eventsDataStorage.watchTopics.listen((event) {
      eventData = eventData.copyWith(topics: event);
      streamEventsController.add(eventData);
    });
    _eventsDataStorage.watchEvents.listen((event) {
      eventData = eventData.copyWith(events: event);
      streamEventsController.add(eventData);
    });
  }

  final streamEventsController = BehaviorSubject<EventsDataDomain>();

  Stream<EventsDataDomain> get eventsWatch => streamEventsController.stream;

  Future<void> getAllEvents() async {
    var data = await _eventsService.getEvents(1);
    List<EventStorage> listEvents = [];
    List<TopicStorage> listTopic = [];
    if (data != null) {
      listEvents.addAll(data.data.map((e) => e.toStorage));
      listTopic.addAll(data.included.map((e) => e.toStorage));
      for (int i = 1; i < data!.meta.total; i++) {
        if (i == 1) break;
        data = await await _eventsService.getEvents(i + 1);
        if (data != null) {
          listEvents.addAll(data.data.map((e) => e.toStorage));
          listTopic.addAll(data.included.map((e) => e.toStorage));
        }
      }
    } else {
      listEvents.addAll(_eventsDataStorage.eventList);
      listTopic.addAll(_eventsDataStorage.topicList);
    }
    listTopic.forEach((element) {
      _eventsDataStorage.addTopic(element);
    });
    listEvents.removeWhere((element) => element.startEvent.difference(DateTime.now()).inSeconds < 0);
    _eventsDataStorage.eventList = listEvents;
  }

  Future<List<EventDomain>> getEvents() async {
    return _eventsDataStorage.eventList.map((e) => e.toDomain).toList();
  }

  Future<EventDomain?> getEvent(String id) async {
    return _eventsDataStorage.eventList.firstWhere((element) => element.id == id).toDomain;
  }

  Stream<List<String>> get eventsPayIdListWatch => _eventsDataStorage.watchEventsPayId;

  Future<bool> payEvent(String id) async {
    if (_eventsDataStorage.eventsPayIdList.any((element) => element == id)) {
      return false;
    }
    bool data = await _eventsService.payEvent(id);
    if (data) {
      _eventsDataStorage.addEventPayId(id);
      return true;
    } else {
      return false;
    }
  }

  List<String> get getEventsPayIdList => _eventsDataStorage.eventsPayIdList;
}
