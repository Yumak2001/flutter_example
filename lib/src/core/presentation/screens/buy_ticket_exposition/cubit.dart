import 'package:faneron_mobile/src/core/domain/repository/ticket.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class BuyTicketExpositionCubit extends Cubit<BuyTicketState> {
  final TicketRepository _ticketRepository;

  BuyTicketExpositionCubit(
    this._ticketRepository,
  ) : super(BuyTicketState(dates: buildDates())) {}

  onBuyButtonPressed() async {
    final date = DateFormat("yyyy-MM-dd").format(state.dates![state.selectedDateIndex]);
    final result = await _ticketRepository.buyTicket(date);

    if (result.isSuccess) {
      if (result.value == "none") {
        emit(state.copyWith(isTicketBuyUrlIsSuccess: false));
      } else {
        emit(state.copyWith(isTicketBuyUrlIsSuccess: true, ticketBuyUrl: result.value));
      }
    } else {
      emit(state.copyWith(isTicketBuyUrlIsSuccess: false));
    }
    await Future.delayed(Duration(seconds: 1));
    state.isTicketBuyUrlIsSuccess = null;
  }

  setSelectedDate(int index) {
    emit(state.copyWith(selectedDateIndex: index));
  }
}

List<DateTime> buildDates() {
  return List.generate(30, (index) => DateTime.now().add(Duration(days: index)));
}

class BuyTicketState {
  final int selectedDateIndex;
  final List<DateTime>? dates;
  bool? isTicketBuyUrlIsSuccess;
  final String ticketBuyUrl;

  BuyTicketState({
    this.dates,
    this.selectedDateIndex = 0,
    this.isTicketBuyUrlIsSuccess,
    this.ticketBuyUrl = "",
  });

  BuyTicketState copyWith({
    int? selectedDateIndex,
    List<DateTime>? dates,
    bool? isTicketBuyUrlIsSuccess,
    String? ticketBuyUrl,
  }) {
    return BuyTicketState(
      selectedDateIndex: selectedDateIndex ?? this.selectedDateIndex,
      dates: dates ?? this.dates,
      isTicketBuyUrlIsSuccess: isTicketBuyUrlIsSuccess ?? this.isTicketBuyUrlIsSuccess,
      ticketBuyUrl: ticketBuyUrl ?? this.ticketBuyUrl,
    );
  }
}
