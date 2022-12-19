import 'package:faneron_mobile/src/core/domain/entities/user.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';

class SettingProfileState {
  final ScreenStatus screenStatus;
  final UserDomain? profile;
  final String? firstNameEdit;
  final String? surNameEdit;
  final String? cityEdit;
  final String? ageEdit;
  final int activeProfile;
  final bool loadingUploadImage;
  final bool loadingSaveData;

  SettingProfileState({
    this.screenStatus = ScreenStatus.loading,
    this.profile,
    this.firstNameEdit,
    this.surNameEdit,
    this.cityEdit,
    this.ageEdit,
    this.activeProfile = 0,
    this.loadingUploadImage = false,
    this.loadingSaveData = false,
  });

  SettingProfileState copyWith({
    ScreenStatus? screenStatus,
    UserDomain? profile,
    String? firstNameEdit,
    String? surNameEdit,
    String? cityEdit,
    String? ageEdit,
    int? activeProfile,
    bool? loadingUploadImage,
    bool? loadingSaveData,
  }) =>
      SettingProfileState(
        screenStatus: screenStatus ?? this.screenStatus,
        profile: profile ?? this.profile,
        firstNameEdit: firstNameEdit ?? this.firstNameEdit,
        surNameEdit: surNameEdit ?? this.surNameEdit,
        cityEdit: (cityEdit == '') ? null : cityEdit ?? this.cityEdit,
        ageEdit: (ageEdit == '') ? null : ageEdit ?? this.ageEdit,
        activeProfile: activeProfile ?? this.activeProfile,
        loadingUploadImage: loadingUploadImage ?? this.loadingUploadImage,
        loadingSaveData: loadingSaveData ?? this.loadingSaveData,
      );
}
