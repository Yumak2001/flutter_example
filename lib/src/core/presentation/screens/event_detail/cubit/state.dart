import 'package:faneron_mobile/src/core/domain/entities/events.dart';

class EventDetailState {
  final EventDomain? event;
  final bool loadButton;
  final bool thisPay;

  EventDetailState({
    this.event,
    this.loadButton = false,
    this.thisPay = false,
  });

  EventDetailState copyWith({
    EventDomain? event,
    bool? loadButton,
    bool? thisPay,
  }) =>
      EventDetailState(
        event: event ?? this.event,
        loadButton: loadButton ?? this.loadButton,
        thisPay: thisPay ?? this.thisPay,
      );
}
