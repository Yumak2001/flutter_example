import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:faneron_mobile/src/core/domain/entities/tickets.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';

class TicketsState {
  final ScreenStatus screenStatus;
  final List<TicketDomain> tickets;
  final List<TicketDomain> historyTickets;
  final List<TopicDomain> topics;
  final bool viewHistory;

  TicketsState({
    this.screenStatus = ScreenStatus.loading,
    this.tickets = const [],
    this.historyTickets = const [],
    this.topics = const [],
    this.viewHistory = false,
  });

  TicketsState copyWith({
    ScreenStatus? screenStatus,
    List<TicketDomain>? tickets,
    List<TicketDomain>? historyTickets,
    List<TopicDomain>? topics,
    bool? viewHistory,
  }) =>
      TicketsState(
        screenStatus: screenStatus ?? this.screenStatus,
        tickets: tickets ?? this.tickets,
        historyTickets: historyTickets ?? this.historyTickets,
        topics: topics ?? this.topics,
        viewHistory: viewHistory ?? this.viewHistory,
      );
}
