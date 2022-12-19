import 'package:faneron_mobile/src/common/utils/result.dart';

abstract class TicketRepository {
  Future<Result<String>> buyTicket(String date);
}
