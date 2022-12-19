import 'package:faneron_mobile/src/core/domain/entities/interest_profile.dart';
import 'package:faneron_mobile/src/core/domain/repository/auth.dart';
import 'package:faneron_mobile/src/core/domain/repository/profile.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/profile/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ProfileCubit extends Cubit<ProfileState> {
  final RouterEventSink _routerEventSink;
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  ProfileCubit(
    this._routerEventSink,
    this._authRepository,
    this._profileRepository,
  ) : super(ProfileState()) {
    _profileRepository.isAuthWatch.listen((event) {
      onUpdateIsAuth(event);
    });
    _profileRepository.myProfileWatch.listen((event) {
      emit(state.copyWith(user: event));
    });
    _profileRepository.interestProfileWatch.listen((event) {
      emit(state.copyWith(
        interestProfile: event,
      ));
    });

    onLoad();
  }

  onLoad() async {
    emit(state.copyWith(
      screenStatus: ScreenStatus.view,
    ));
    _profileRepository.getMyTickets();
  }

  onTapLogOut() async {
    _authRepository.logOut();
  }

  onUpdateIsAuth(bool isAuth) async {
    if (isAuth) {
      _profileRepository.myProfileUpdate();
    }
    emit(state.copyWith(isAuth: isAuth));
  }

  onUpdateInterest(InterestProfileDomain newInterest) async {
    _profileRepository.setInterest(newInterest);
  }

  onFeedBackButtonPressed() => _routerEventSink.onRouteToFeedbackDialog();
}
