import 'package:faneron_mobile/src/core/data/storage/tickets.dart';

class TicketDto {
  final String id;
  final bool is_free;
  final String qr_url;
  final String eventId;

  TicketDto({
    required this.id,
    required this.is_free,
    required this.qr_url,
    required this.eventId,
  });

  TicketStorage get toStorage => TicketStorage(
        id: id,
        is_free: is_free,
        qr_url: 'https://faneron.ru/' + qr_url,
        eventId: eventId,
      );
}
