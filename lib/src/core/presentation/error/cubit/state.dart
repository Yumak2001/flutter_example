import 'package:faneron_mobile/src/core/domain/repository/errors.dart';

class ErrorState {
  final ErrorTypes? errorTypes;
  final bool isLight;

  ErrorState({
    this.errorTypes,
    this.isLight = false,
  });

  ErrorState copyWith({
    ErrorTypes? errorTypes,
    required bool isLight,
  }) =>
      ErrorState(
        errorTypes: errorTypes,
        isLight: isLight,
      );
}
