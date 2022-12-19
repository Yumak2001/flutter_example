import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/common/utils/result.dart';
import 'package:faneron_mobile/src/core/data/network/service/ticket.dart';
import 'package:faneron_mobile/src/core/domain/repository/ticket.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TicketRepository)
class TicketRepositoryImpl implements TicketRepository {
  final TicketService _ticketService;

  TicketRepositoryImpl(this._ticketService);

  Future<Result<String>> buyTicket(String date) async {
    try {
      final response = await _ticketService.buyTicket(date);
      return Result.success(response);
    } catch (e) {
      Log.error(e.toString());
      return Result.failure(Failure(e));
    }
  }
}
