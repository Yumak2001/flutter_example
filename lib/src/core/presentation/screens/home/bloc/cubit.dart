import 'package:faneron_mobile/src/core/domain/repository/auth.dart';
import 'package:faneron_mobile/src/core/domain/repository/profile.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

typedef HomeEmit = Emitter<HomeState>;

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  final RouterEventSink _routerEventSink;
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  HomeCubit(
    this._routerEventSink,
    this._authRepository,
    this._profileRepository,
  ) : super(HomeState()) {
    _onLoad();
  }

  _onLoad() async {
    emit(state.copyWith());
  }

  onTapBottomMenu(int index) async {
    if (index == state.currentHomePage.index) {
      ///If on tap current page icon
      return;
    }
    if (index == HomeScreens.profile.index) {
      if (!_profileRepository.isAuth()) {
        _routerEventSink.onRouteToAuth(callback: () {
          _routerEventSink.onPop();
        });
      }
    }
    _routerEventSink.onTapBottomMenu(index);
    emit(state.copyWith(
      currentHomePage: HomeScreens.values[index],
    ));
  }
}
