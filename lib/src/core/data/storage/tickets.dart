import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'tickets.g.dart';

abstract class TicketsDataStorage {
  late List<TicketStorage> ticketsList;
  Stream<List<TicketStorage>> get watchTickets;
  void addTicket(TicketStorage ticket);
  void clear();
}

@Injectable(as: TicketsDataStorage)
class TicketsDataStorageHive implements TicketsDataStorage {
  static const _hiveBoxName = 'tickets';

  ///Box
  Box get _hiveBox => Hive.box(_hiveBoxName);

  static Future init() async {
    await Hive.openBox(_hiveBoxName);
  }

  TicketsDataStorageHive() {
    _hiveBox.watch().listen((event) {
      if (event.key == _Keys.tickets.name) {
        _watchTicketsController.add(event.value as List<TicketStorage>);
      }

      _watchTicketsController.add(ticketsList);
    });
  }

  ///Streams
  final _watchTicketsController = BehaviorSubject<List<TicketStorage>>();

  @override
  Stream<List<TicketStorage>> get watchTickets => _watchTicketsController.stream;

  ///Getter
  List<TicketStorage> get ticketsList {
    var tickets = _hiveBox.get(_Keys.tickets.name);
    return tickets != null ? List<TicketStorage>.from(tickets).toList() : List<TicketStorage>.empty();
  }

  ///Setter
  set ticketsList(List<TicketStorage> value) {
    _hiveBox.put(_Keys.tickets.name, value);
  }

  @override
  void addTicket(TicketStorage ticket) {
    var list = ticketsList.toList();
    if (list.any((element) => element.id == ticket.id)) {
      list.removeWhere((element) => element.id == ticket.id);
    }
    list.add(ticket);
    ticketsList = list;
  }

  @override
  void clear() {
    _hiveBox.put(_Keys.tickets.name, []);
  }
}

enum _Keys {
  tickets,
}

@HiveType(typeId: 4)
class TicketStorage {
  @HiveField(0)
  String id;
  @HiveField(1)
  bool is_free;
  @HiveField(2)
  String qr_url;
  @HiveField(3)
  String eventId;

  TicketStorage({
    required this.id,
    required this.is_free,
    required this.qr_url,
    required this.eventId,
  });
}
