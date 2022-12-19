import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/data/network/service/profile.dart';
import 'package:faneron_mobile/src/core/data/storage/events.dart';
import 'package:faneron_mobile/src/core/data/storage/tickets.dart';
import 'package:faneron_mobile/src/core/data/storage/user.dart';
import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:faneron_mobile/src/core/domain/entities/interest_profile.dart';
import 'package:faneron_mobile/src/core/domain/entities/tickets.dart';
import 'package:faneron_mobile/src/core/domain/entities/user.dart';
import 'package:faneron_mobile/src/core/domain/repository/profile.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileService profileService;
  final UserDataStorage userStorage;
  final EventsDataStorage eventsDataStorage;
  final TicketsDataStorage ticketsDataStorage;
  ProfileRepositoryImpl(
    this.profileService,
    this.userStorage,
    this.eventsDataStorage,
    this.ticketsDataStorage,
  ) {
    userStorage.interestProfileWatch.listen((event) {
      interestProfileStreamController.add(event.toDomain);
    });
    ticketsDataStorage.watchTickets.listen((event) {
      myTicketsStreamController.add(event
          .map((e) => TicketDomain(
                id: e.id,
                isFree: e.is_free,
                urlQrCode: e.qr_url,
                event: eventsDataStorage.eventTicketsList.firstWhere((element) => element.id == e.eventId).toDomain,
              ))
          .toList());
    });
    userStorage.watchUser.listen((event) {
      myProfileStreamController.add(event);
    });
    userStorage.watchIsAuth.listen((event) {
      if (event) {
        getMyTickets();
      }
    });
  }

  final myProfileStreamController = BehaviorSubject<UserDomain?>();
  final myTicketsStreamController = BehaviorSubject<List<TicketDomain>>.seeded([]);
  final interestProfileStreamController = BehaviorSubject<InterestProfileDomain>();

  @override
  Future<void> myProfileUpdate() async {
    var data = await profileService.myProfileUpdate();
    if (data != null) {
      userStorage.interestProfile = InterestProfileStorage.fromNetwork(data.interests.data);
      userStorage.user = data.toStorage;
    }
  }

  @override
  Stream<bool> get isAuthWatch => userStorage.watchIsAuth;

  @override
  Stream<UserDomain?> get myProfileWatch => myProfileStreamController.stream;

  @override
  bool isAuth() => userStorage.isAuth;

  @override
  Stream<List<TicketDomain>> get myTicketsWatch => myTicketsStreamController.stream;

  @override
  Future<void> getMyTickets() async {
    myTicketsStreamController.add(ticketsDataStorage.ticketsList
        .map((e) => TicketDomain(
              id: e.id,
              isFree: e.is_free,
              urlQrCode: e.qr_url,
              event: eventsDataStorage.eventTicketsList.firstWhere((element) => element.id == e.eventId).toDomain,
            ))
        .toList());
    var data = await profileService.getMyTickets();
    if (data != null) {
      data.included.forEach((element) {
        if (element.type == 'event') {
          var event = element.toEvent;
          eventsDataStorage.setEventTickets(event!);
          eventsDataStorage.addEventPayId(event.id);
        } else if (element.type == 'topics') {
          eventsDataStorage
              .addTopic(TopicStorage(id: element.id.toString(), title: element.attributes['title'] as String));
        }
      });
      data.data.forEach((element) async {
        var ticket = element.toTicket;
        if (ticket != null) {
          ticketsDataStorage.addTicket(ticket.toStorage);
        }
      });
    }
  }

  @override
  Future<bool> sendImage(String filePath) async {
    var result = await profileService.updatePhotoProfile(filePath);
    if (result != null) {
      this.myProfileUpdate();
      return true;
    }
    return false;
  }

  @override
  Stream<InterestProfileDomain> get interestProfileWatch => interestProfileStreamController.stream;

  @override
  void setInterest(InterestProfileDomain interest) {
    userStorage.interestProfile.replace(interest);
    profileService.updateProfileData(
      firstName: userStorage.user!.firstName,
      surName: userStorage.user!.surName,
      city: userStorage.user!.city,
      age: userStorage.user!.age,
      interest: interest.toNetwork,
    );
  }

  @override
  Future<bool> updateProfileData({
    required String firstName,
    required String surName,
    String? city,
    String? age,
  }) async {
    var result = await profileService.updateProfileData(
      firstName: firstName,
      surName: surName,
      city: city,
      age: age,
      interest: userStorage.interestProfile.toDomain.toNetwork,
    );
    if (result != null) {
      myProfileUpdate();
      return result;
    } else {
      return false;
    }
  }

  @override
  List<TopicDomain> getTopic() {
    return eventsDataStorage.topicList.map((e) => e.toDomain).toList();
  }
}
