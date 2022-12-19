import 'package:faneron_mobile/src/core/domain/entities/events.dart';

abstract class EventsRepository {
  Stream<EventsDataDomain> get eventsWatch;
  Future<void> getAllEvents();
  Future<List<EventDomain>> getEvents();
  Future<EventDomain?> getEvent(String id);
  Stream<List<String>> get eventsPayIdListWatch;
  Future<bool> payEvent(String id);
  List<String> get getEventsPayIdList;
}
