import 'package:faneron_mobile/src/core/domain/entities/user.dart';
import 'package:faneron_mobile/src/core/domain/repository/profile.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/screens/setting_profile/setting_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SettingProfileCubit extends Cubit<SettingProfileState> {
  final ProfileRepository _profileRepository;

  SettingProfileCubit(
    this._profileRepository,
  ) : super(SettingProfileState()) {
    _profileRepository.myProfileWatch.listen((event) {
      onLoad(event);
    });
  }

  onLoad(UserDomain? profile) async {
    emit(state.copyWith(
      profile: profile,
      screenStatus: ScreenStatus.view,
      firstNameEdit: profile?.firstName,
      surNameEdit: profile?.surName,
      cityEdit: profile?.city,
      ageEdit: profile?.age,
    ));
  }

  onTapSave() async {
    emit(state.copyWith(
      loadingSaveData: true,
    ));
    if (state.firstNameEdit != null &&
        state.firstNameEdit != '' &&
        state.surNameEdit != null &&
        state.surNameEdit != '') {
      await _profileRepository.updateProfileData(
        firstName: state.firstNameEdit!,
        surName: state.surNameEdit!,
        city: state.cityEdit,
        age: state.ageEdit,
      );
    }
    emit(state.copyWith(
      loadingSaveData: false,
    ));
  }

  onChangeEditing({
    String? firstName,
    String? surName,
    String? city,
    String? age,
  }) {
    emit(state.copyWith(
      firstNameEdit: firstName,
      surNameEdit: surName,
      cityEdit: city,
      ageEdit: age,
    ));
  }

  onTapProfileImage({
    required String path,
    required int id,
  }) async {
    emit(state.copyWith(
      activeProfile: id,
      loadingUploadImage: true,
    ));
    await _profileRepository.sendImage(path);
    emit(state.copyWith(
      loadingUploadImage: false,
    ));
  }
}
