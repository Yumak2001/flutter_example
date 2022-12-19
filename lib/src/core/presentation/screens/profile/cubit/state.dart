import 'package:faneron_mobile/src/core/domain/entities/interest_profile.dart';
import 'package:faneron_mobile/src/core/domain/entities/user.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';

class ProfileState {
  final ScreenStatus screenStatus;
  final bool isAuth;
  final UserDomain? user;
  final InterestProfileDomain interestProfile;

  ProfileState({
    this.screenStatus = ScreenStatus.loading,
    this.isAuth = false,
    this.user,
    this.interestProfile = const InterestProfileDomain(),
  });

  ProfileState copyWith({
    ScreenStatus? screenStatus,
    bool? isAuth,
    UserDomain? user,
    InterestProfileDomain? interestProfile,
  }) =>
      ProfileState(
        screenStatus: screenStatus ?? this.screenStatus,
        isAuth: isAuth ?? this.isAuth,
        user: user ?? this.user,
        interestProfile: interestProfile ?? this.interestProfile,
      );
}
