import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/domain/entities/tickets.dart';
import 'package:faneron_mobile/src/core/domain/repository/profile.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/screens/tickets/tickets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class TicketsCubit extends Cubit<TicketsState> {
  final ProfileRepository profileRepository;

  List<TicketDomain> tickets = [];

  TicketsCubit(
    this.profileRepository,
  ) : super(TicketsState()) {
    _onLoad();
    profileRepository.myTicketsWatch.listen((event) {
      if (event.isNotEmpty) {
        tickets = event;
        onViewTicket();
      }
    });
  }

  _onLoad() async {
    profileRepository.getMyTickets();
  }

  onViewTicket() {
    List<TicketDomain> ticketsView = [];
    List<TicketDomain> historyTickets = [];
    tickets.forEach((element) {
      if (element.event.finishEvent.difference(DateTime.now()).inSeconds > 0) {
        ticketsView.add(element);
      } else {
        historyTickets.add(element);
      }
    });
    ticketsView.sort((a, b) => a.event.startEvent.compareTo(b.event.finishEvent));
    historyTickets.sort((a, b) => a.event.startEvent.compareTo(b.event.finishEvent));
    emit(state.copyWith(
      screenStatus: ScreenStatus.view,
      topics: profileRepository.getTopic(),
      tickets: ticketsView,
      historyTickets: historyTickets,
    ));
  }

  tapHistory() {
    emit(state.copyWith(
      viewHistory: !state.viewHistory,
    ));
  }
}
