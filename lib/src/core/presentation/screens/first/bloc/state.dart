import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';

class FirstState {
  final ScreenStatus currentStatus;

  FirstState({
    this.currentStatus = ScreenStatus.loading,
  });

  FirstState copyWith({
    ScreenStatus? currentStatus,
  }) =>
      FirstState(
        currentStatus: currentStatus ?? this.currentStatus,
      );
}
