import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';

class HomeState {
  final ScreenStatus screenStatus;
  final HomeScreens currentHomePage;

  HomeState({
    this.screenStatus = ScreenStatus.view,
    this.currentHomePage = HomeScreens.main,
  });

  HomeState copyWith({
    ScreenStatus? screenStatus,
    HomeScreens? currentHomePage,
  }) {
    return HomeState(
      screenStatus: screenStatus ?? this.screenStatus,
      currentHomePage: currentHomePage ?? this.currentHomePage,
    );
  }
}
