import 'package:built_value/built_value.dart';
import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/data/network/entities/ticket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class DataResponseDto {
  final String type;
  final dynamic id;
  final Map attributes;
  final Map? relationships;

  DataResponseDto({
    required this.type,
    required this.id,
    required this.attributes,
    required this.relationships,
  });

  factory DataResponseDto.fromJson(Map<String, dynamic> json) {
    return _$DataResponseDtoFromJson(json);
  }

  TicketDto? get toTicket {
    if (type == 'tickets') {
      return TicketDto(
        id: this.id.toString(),
        is_free: attributes['is-free'] as bool,
        qr_url: attributes['qr-code-url'] as String,
        eventId: relationships?['event']['data']['id'] ?? '',
      );
    }
    return null;
  }
}
