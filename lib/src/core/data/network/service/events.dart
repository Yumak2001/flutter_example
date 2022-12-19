import 'dart:convert';

import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/data/network/client.dart';
import 'package:faneron_mobile/src/core/data/network/entities/events.dart';
import 'package:injectable/injectable.dart';

abstract class EventsService {
  Future<EventsDataDto?> getEvents(int page);
  Future<bool> payEvent(String id);
}

@Injectable(as: EventsService)
class EventsServiceImpl implements EventsService {
  final Api api;
  EventsServiceImpl(this.api);

  Future<EventsDataDto?> getEvents(int page) async {
    try {
      var result = await api.client.get('/events', queryParameters: {'page': page});
      if (result.statusCode == 200) {
        return EventsDataDto.fromJson(Map<String, dynamic>.from(result.data));
      } else {
        return null;
      }
    } catch (e) {
      Log.error(e.toString());
      return null;
    }
  }

  Future<bool> payEvent(String id) async {
    try {
      var result = await api.client.post(
        '/events/ticket/take',
        data: {
          'event-id': int.parse(id),
          'event-type': 'regular',
        },
      );
      if (result.statusCode == 200) {
        Log.info('Pay event $id: ${result.data}');
        return Map<String, dynamic>.from(result.data)['success'] as bool;
      } else {
        return false;
      }
    } catch (e) {
      Log.error(e.toString());
      return false;
    }
  }
}
