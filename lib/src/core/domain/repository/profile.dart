import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:faneron_mobile/src/core/domain/entities/interest_profile.dart';
import 'package:faneron_mobile/src/core/domain/entities/tickets.dart';
import 'package:faneron_mobile/src/core/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<void> myProfileUpdate();
  Stream<UserDomain?> get myProfileWatch;
  Stream<bool> get isAuthWatch;
  bool isAuth();
  Stream<List<TicketDomain>> get myTicketsWatch;
  Future<void> getMyTickets();
  Future<bool> sendImage(String filePath);
  Stream<InterestProfileDomain> get interestProfileWatch;
  void setInterest(InterestProfileDomain interest);
  Future<bool> updateProfileData({required String firstName, required String surName, String? city, String? age});
  List<TopicDomain> getTopic();
}
