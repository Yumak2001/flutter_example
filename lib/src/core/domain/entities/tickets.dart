import 'package:faneron_mobile/src/core/domain/entities/events.dart';

class TicketDomain {
  final String id;
  final bool isFree;
  final String urlQrCode;
  final EventDomain event;
  TicketDomain({
    required this.id,
    required this.isFree,
    required this.urlQrCode,
    required this.event,
  });
}
