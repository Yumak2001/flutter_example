import 'package:faneron_mobile/src/core/data/network/client.dart';
import 'package:injectable/injectable.dart';

abstract class TicketService {
  Future<String> buyTicket(String date);
}

@Injectable(as: TicketService)
class TicketServiceImpl implements TicketService {
  final Api api;

  TicketServiceImpl(this.api);

  @override

  /// date 2022-06-09
  Future<String> buyTicket(String date) async {
    final result = await api.client.get(
      '/ticket/$date',
    );
    return result.data["url"] as String;
  }
}
