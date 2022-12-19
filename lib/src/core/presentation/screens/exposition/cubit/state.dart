import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';

class ExpositionState {
  final ScreenStatus screenStatus;

  ExpositionState({this.screenStatus = ScreenStatus.view});

  ExpositionState copyWith({
    ScreenStatus? screenStatus,
  }) =>
      ExpositionState(
        screenStatus: screenStatus ?? this.screenStatus,
      );
}
