import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';

class MainState {
  final ScreenStatus screenStatus;

  MainState({
    this.screenStatus = ScreenStatus.loading,
  });

  MainState copyWith({
    ScreenStatus? screenStatus,
  }) =>
      MainState(
        screenStatus: screenStatus ?? this.screenStatus,
      );
}
